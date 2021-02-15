class Parser
    def parse_csv(year=2020)
        CSV.open("#{year}FD.csv", "r", { col_sep: "\t", quote_char: "|" }).each do |row|
            get_pdf(row.last, year)
        end
    end

    def get_pdf(doc_id, year)
        http_conn = Faraday.new do |builder|
            builder.adapter Faraday.default_adapter
        end 
        response = http_conn.get "https://disclosures-clerk.house.gov/public_disc/ptr-pdfs/#{year}/#{doc_id}.pdf"
        if response.body.include?("message in error and you are unable to send your")
            return if File.read('./data/#{year}/invalid_doc_ids.txt').include?(doc_id)

            File.open("./data/#{year}/invalid_doc_ids.txt", 'a') { |f| f.puts "#{doc_id}\n" }
        else
            File.open("./data/#{year}/#{doc_id}.pdf", 'wb') { |f| f.write(response.body) }
        end
    end
end