require 'httparty'
class Api
    include HTTParty
    
    #API has only one endpoint = products
    URL = "https://makeup-api.herokuapp.com/api/v1/products.json"
    ENDPOINT = "product_tags"

    def self.search_endpoint(search_term)  
        search_url = URL + "?" + ENDPOINT + "=" + search_term
        self.call_api(search_url)
    end
   
    # private
    def self.call_api(url)
        HTTParty.get(url)
    end
end