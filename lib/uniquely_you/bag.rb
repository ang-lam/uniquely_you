
class Bag

    attr_reader :name
    @@all = []

    def initialize(name = "favorites")
        @name = name
    end

    def self.all
        @@all
    end

    def item_count
        @items.count
    end

    def self.add_item(tag, product_type)
        search = Api.search_endpoint(tag)
        items = search.select {|item| item["product_type"] == "#{product_type}"}
        # links = []
        items.collect do |item|
            item["product_link"]
        end


        # adjusted_input = input - 1
        # @items < items[adjusted_input
    end

end