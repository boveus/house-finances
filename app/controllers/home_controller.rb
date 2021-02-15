class HomeController < ApplicationController
    include HomeHelper

    def find_representatives
        respond_to do |format|
            format.json { render json: representatives }
        end
    end

    private

    def representatives
        representatives_by_name_or_district(name: name_params, district: district_params)
    end

    def name_params
        params.permit(:name)["name"]
    end

    def district_params
        params.permit(:district)["district"]
    end
end
