module HomeHelper
    def representatives_by_name_or_district(name: nil,  district: nil)
        if name
            Representative.where("name ilike ?", "%#{name}%")
        elsif district
            Representative.where("district ilike ?", "%#{district}%")
        end
    end
end
