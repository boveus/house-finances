class RepresentativeController < ApplicationController
    include RepresentativeHelper

    def find_representatives
        respond_to do |format|
            format.html { render "index", layout: false }
        end
    end

    private

    helper_method :representative
    def representative
        Representative.find(params[:id])
    end

    helper_method :representatives
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
