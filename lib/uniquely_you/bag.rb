class Bag

    attr_reader :name, :cli
    
    @@all = []
    
    @@grn="\e[1;32m"
    @@white="\e[0m"
    @@ublue="\e[4;34m"

    def initialize(name = "favorites")
        @name = name
    end

    def self.all
        @@all
    end
    
    def self.item_count
        self.all.count
    end

    def self.view_bag
        if item_count > 0
            puts "#{@@grn}Your bag has #{item_count} item(s).#{@@white}\n\n"
            self.all.each_with_index do |list_item, i|
                puts "#{i + 1}. #{@@ublue}#{list_item}#{@@white}"
            end
            puts "\n\n#{@@grn}Enter corresponding number of item you wish to remove from your bag.\n\nType 'clear' to empty your bag.\n\nType 'menu' to return to main menu.#{@@white}"
        else
            puts "#{@@grn}There are no items in your bag. Type 'menu' to go back to main menu.#{@@white}"
        end
    end

    def self.empty
        self.all.clear
        self.view_bag
    end

    def self.remove(input)
        adjusted_input = input.to_i - 1
        if adjusted_input != -1
            self.all.delete_at(adjusted_input)
            self.view_bag
        end
        system("clear") # DETELE?????
        self.view_bag
    end

    def self.add_item(tag, product_type)
        search = Api.search_endpoint(tag)
        items = search.select {|item| item["product_type"] == "#{product_type}"}
        items.collect do |item|
            item["product_link"]
        end
    end
end