require 'pry'
require 'httparty'
class Api
    include HTTParty
    #API has only one endpoint = products
    URL = "https://makeup-api.herokuapp.com/api/v1/products.json"
    ENDPOINT = "product_tags"
    SEARCH_TERMS = %W(brand product_type product_category product_link)

    # def self.get_search(search)
    #     self.call_api("#{URL}?#{search}")
    # end
    
    def self.search_endpoint(search_term)  
        search_url = URL + "?" + ENDPOINT + "=" + search_term
        self.call_api(search_url)
        #https://makeup-api.herokuapp.com/api/v1/products.json?product_tags=vegan
        # ^url + &SERACH_TERM=...
    end
    
    
    # private
    def self.call_api(url)
        HTTParty.get(url)
    end
    # binding.pry
end