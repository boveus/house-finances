class Propublica
    extend self
    
    def api_key
        Rails.application.credentials.aws[:propublica_api_key]
    end
end