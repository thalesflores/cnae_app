module Integrations
  class Cnab
    def initialize
      @http_request = HTTParty
      @url = ENV['URL_CNAB']
    end

    def extract
      response = @http_request.get(@url).parsed_response
      response.split("\n")
    end
  end

end
