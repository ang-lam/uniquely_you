require 'pry'
class Product
    
    attr_accessor :name, :brand, :type, :description, :link, :tags

    def initialize(result_product)
        @name = result_product["name"]
        @brand = result_product["brand"]
        @type = result_product["product_type"]
        @tags = result_product["tag_list"]
        @description = result_product["description"]
        @link = result_product["product_link"]
    end
end