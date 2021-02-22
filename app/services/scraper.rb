class Scraper
    attr_reader :name,
                :district

    def import(folder)
        Asset.destroy_all
        Representative.destroy_all
        Dir.entries("./data/#{folder}").each do |file|
            next if file == "." || file == ".."

            result = read_pdf(file) rescue false
            if result
                rep = create_representative(result[:name], result[:district])


                    
                result[:assets].each do |asset|
                    create_asset(rep, asset, result[:reference])
                end
            end
        end
    end

    def create_asset(rep, asset, reference)
        date = parse_date(asset[3])
        return unless date

        rep.assets.find_or_create_by(name: asset[0], transaction_type: asset[1], ownership: asset[2], date: date, dollar_amount: asset[4], reference: reference)
    end

    def read_pdf(filename)
        parsed_text = parse_text(filename)

        asset_values = []

        parsed_text.each do |parsed_text|
            # Break at bottom of doc where signature is
            break if parsed_text.include?("certification anDSignature")
            # Skip header of assets
            next if parsed_text.include?("NotificationAmount")
            next if parsed_text.include?("$200?")

            set_district_id(parsed_text)
            set_name(parsed_text)
            next unless contains_dollar?(parsed_text)

            asset_values << asset_strings(parsed_text)
        end
        
        {name: @name, district: @district, assets: asset_values, reference: filename}
    end

    def parse_text(filename)
        reader = PDF::Reader.new("./data/2020/#{filename}") 

        begin
            text = reader.pages.map do | page |
                page.text.split("\n\n")
            end
        rescue
            puts "Error opening #{filename}"
        end


        text.flatten
    end

    def asset_strings(parsed_text)
        asset_string = parsed_text.lstrip.split

        asset_name_chars = asset_string.map do |string|
            next if date?(string) || contains_dollar?(string) || string.length < 2

            string
        end.compact.join(' ')

        transaction_type = asset_string.find { |string| transaction_type?(string) } || transaction_type_from_asset_name(asset_name_chars)

        ownership = asset_string.find { |string| ownership_column?(string) } || 'Unknown'

        asset_date = asset_string.find { |string| date?(string) }

        asset_dollar_amounts = asset_string.map do |string| 
            if contains_dollar?(string)
                string.split("$").last.gsub(',', '').gsub('g', '')
            end
        end.compact.join("-")

        [asset_name_chars, transaction_type, ownership, asset_date, asset_dollar_amounts]
    end

    def transaction_type_from_asset_name(asset_name_chars)
        # Try to get the transaction type from the last characters of the asset name
        # This is neccesary due to how the pdf gets parsed.
        if transaction_type?(asset_name_chars[-1]) 
            asset_name_chars[-1]
        elsif transaction_type?(asset_name_chars[-2]) 
            asset_name_chars[-2]
        elsif partial_transaction_type?(asset_name_chars)
            'S (partial)'
        else
            'Unknown'
        end
    end

    def partial_transaction_type?(asset_name_chars)
        asset_name_chars.include?('S)(p') || asset_name_chars.include?('S (p') 
    end

    def transaction_type?(asset_string)
        ['S', 'P', 'G', 'E'].include?(asset_string)
    end

    def ownership_column?(asset_string)
       ['SP', 'JT', 'DC'].include?(asset_string)
    end

    def contains_dollar?(string)
        string.include?("$")
    end

    def date?(string)
        d, m, y = string.split("/").map(&:to_i) rescue false
        Date.valid_date?(y, d, m) 
    end

    def parse_date(string)
        return unless date?(string)
        d, m, y = string.split("/").map(&:to_i)
        Date.new(y, d, m) 
    end

    def set_district_id(parsed_text)
        if parsed_text.include?("State/District")
            @district = parsed_text.split("State/District:").last.lstrip.upcase
        end
    end

    def set_name(parsed_text)
        if parsed_text.downcase.include?("name: ")
            format_name(parsed_text)
        end
    end

    def format_name(raw_name)
        # Split on ame: instead of Name: or name: since name can be either case
        @name = raw_name.split("ame:").last.lstrip.split("\n").first
        if (!@name.include?(' '))
            @name = @name.split(/(?=[A-Z])/).join(' ')
        end
    end

    def create_representative(name, district)
        rep = Representative.find_or_create_by(name: name, district: district)
        if rep.invalid?
            # The district doesn't match in some cases, so fall back to just matching the name
            rep = Representative.find_or_create_by(name: name)
        end
        rep
    end
end