class Product
    
    attr_accessor :name, :brand, :type, :description, :link, :tags

    def initialize(product)
        @name = product["name"]
        @brand = product["brand"]
        @type = product["product_type"]
        @tags = product["tag_list"]
        @description = product["description"]
        @link = product["product_link"]
    end

    def self.get_products_by_type(products, type)
        products.select {|item| item.type == "#{type}"}
    end

    def self.get_product_type_names(products)
        products.collect {|item| item.type}
    end
end