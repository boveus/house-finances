module Propublica
    extend self
    
    def api_key
        Rails.application.credentials[:propublica_api_key]
    end

    def member_info(bioguide_id)
        response = Faraday.get("https://api.propublica.org/congress/v1/members/#{bioguide_id}.json") do |req|
            req.headers['X-API-Key'] = api_key
        end
        JSON.parse(response.body)
    end
end