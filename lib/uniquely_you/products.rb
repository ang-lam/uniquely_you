class Products

    attr_reader :products

    def initialize(products)
        @products = products
    end

    def get_products_by_type(type)
        @products.select {|item| item.type == "#{type}"}
    end

    def get_product_type_names
        @products.collect {|item| item.type}
    end

    def get_product(input)
        @products[input].link
    end
end