require 'csv'

module BioguideIds
    extend self

    def import
        bioguide_ids.each do |row|
            name = transform_name(row[:member])
            rep = Representative.where("name ilike ?", "%#{name}%")
            if rep.length > 0
                rep.update(bioguide_id: row[:member_id])
            # elsif name.include?('Mast')
            #     byebug
            end
        end
    end

    def transform_name(name)
        name = name.split('(').first
        first_name = name.split(',').last.split(' ').first
        last_name = name.split(',').first
        "#{first_name} #{last_name}"
    end

    def bioguide_ids 
        CSV.read("./data/bioguide_ids.csv", {  col_sep:";", encoding: "UTF-8", headers: true, header_converters: :symbol })
    end

    def add_bioguide_id
    end
end