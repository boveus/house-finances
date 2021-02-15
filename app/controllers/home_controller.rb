class HomeController < ApplicationController
    def find_representatives
        if name_params
            @rep = Representative.where("name ilike ?", "%#{name_params}%")
        elsif district_params
            @rep = Representative.where("district ilike ?", "%#{district_params}%")
        end

        respond_to do |format|
            format.json { render json: @rep }
        end
    end

    private

    def name_params
        params.permit(:name)["name"]
    end

    def district_params
        params.permit(:district)["district"]
    end
end
