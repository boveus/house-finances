class HomeController < ApplicationController
    def find_representatives
        respond_to do |format|
            format.json { render json: representative }
        end
    end

    private

    def representatives
        representatives_by_name_or_district(name_params, district_params)
    end

    def name_params
        params.permit(:name)["name"]
    end

    def district_params
        params.permit(:district)["district"]
    end
end
