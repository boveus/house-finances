require 'csv'

module BioguideIds
    extend self

    def import
        bioguide_ids.each do |row|
            name = transform_name(row[:member])
            state = state_abbreviation(row[:member])

            rep = Representative.where("name ilike ?", "%#{name}%")
            if rep.length > 0
                rep.update(bioguide_id: row[:member_id])
            else
                rep = Representative.where("name ilike ? AND district ilike ?", "%#{name.split(' ').last}%", "%#{state}%")
                if rep.length == 1
                    rep.update(bioguide_id: row[:member_id])
                end
            end
        end
    end

    def transform_name(name)
        name = name.split('(').first
        first_name = name.split(',').last.split(' ').first
        last_name = name.split(',').first
        "#{first_name} #{last_name}"
    end

    def state_abbreviation(name)
        states[name.split('-').last.strip]
    end 

    def bioguide_ids 
        CSV.read("./data/bioguide_ids.csv", {  col_sep:";", encoding: "UTF-8", headers: true, header_converters: :symbol })
    end

    def add_bioguide_id
    end

    def states
         {"Alabama"=>"AL", "Alaska"=>"AK", "Arizona"=>"AZ", "Arkansas"=>"AR","California"=>"CA",
            "Colorado"=>"CO", "Connecticut"=>"CT", "Delaware"=>"DE", "District of Columbia"=>"DC",
            "Florida"=>"FL", "Georgia"=>"GA", "Hawaii"=>"HI", "Idaho"=>"ID", "Illinois"=>"IL",
            "Indiana"=>"IN", "Iowa"=>"IA","Kansas"=>"KS", "Kentucky"=>"KY", "Louisiana"=>"LA",
            "Maine"=>"ME","Maryland"=>"MD", "Massachusetts"=>"MA", "Michigan"=>"MI", "Minnesota"=>"MN",
            "Mississippi"=>"MS", "Missouri"=>"MO", "Montana"=>"MT","Nebraska"=>"NE", "Nevada"=>"NV",
            "New Hampshire"=>"NH", "NewJersey"=>"NJ", "New Mexico"=>"NM", "New York"=>"NY",
            "North Carolina"=>"NC", "North Dakota"=>"ND", "Ohio"=>"OH", "Oklahoma"=>"OK",
            "Oregon"=>"OR", "Pennsylvania"=>"PA", "Puerto Rico"=>"PR", "Rhode Island"=>"RI",
            "South Carolina"=>"SC", "South Dakota"=>"SD", "Tennessee"=>"TN", "Texas"=>"TX",
            "Utah"=>"UT", "Vermont"=>"VT", "Virginia"=>"VA", "Washington"=>"WA", "West Virginia"=>"WV",
            "Wisconsin"=>"WI", "Wyoming"=>"WY"}
    end
end