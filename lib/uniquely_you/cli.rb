class CLI
    attr_accessor :api, :bag

    @@grn="\e[1;32m"
    @@white="\e[0m"
    @@ublue="\e[4;34m"
    @@pur="\e[1;35m"
    @@whiteback="\e[47m"
    @@bwhite="\e[1;37m"
    
    TAGS = %W(Alcohol\ Free Chemical\ Free Cruelty\ Free Hypoallergenic Oil\ Free Organic Peanut\ Free\ Product Silicone\ Free Sugar\ Free Vegan)

    def call
        system("clear")
        puts "
        ██╗░░░██╗███╗░░██╗  ██╗░██████╗░██╗░░░██╗███████╗██╗░░░░░██╗░░░██╗  ██╗░░░██╗░█████╗░██╗░░░██╗
        ██║░░░██║████╗░██║  ██║██╔═══██╗██║░░░██║██╔════╝██║░░░░░╚██╗░██╔╝  ╚██╗░██╔╝██╔══██╗██║░░░██║
        ██║░░░██║██╔██╗██║  ██║██║██╗██║██║░░░██║█████╗░░██║░░░░░░╚████╔╝░  ░╚████╔╝░██║░░██║██║░░░██║
        ██║░░░██║██║╚████║  ██║╚██████╔╝██║░░░██║██╔══╝░░██║░░░░░░░╚██╔╝░░  ░░╚██╔╝░░██║░░██║██║░░░██║
        ╚██████╔╝██║░╚███║  ██║░╚═██╔═╝░╚██████╔╝███████╗███████╗░░░██║░░░  ░░░██║░░░╚█████╔╝╚██████╔╝
        ░╚═════╝░╚═╝░░╚══╝  ╚═╝░░░╚═╝░░░░╚═════╝░╚══════╝╚══════╝░░░╚═╝░░░  ░░░╚═╝░░░░╚════╝░░╚═════╝░
        "
        list_tags
        menu
    end

    def list_tags
        puts "\n#{@@grn}Select a tag to browse by entering the number corresponding with the tag or type exit to close application.\n\nType bag to view your favorited items.#{@@white}\n\n"
        TAGS.each_with_index do |list_item, i|
            puts "#{i + 1}. #{list_item}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            # gets.strip => takes user input from the console
            input = gets.strip.downcase
            system("clear")
            case input
            when "1"
                sub_menu("alcohol%20free", "foundation")
            when "2"
                sub_menu("chemical%20free", "lipstick")
            when "3"
                sub_menu("cruelty%20free", "foundation", "lip_liner", "lipstick")
            when "4"
                sub_menu("hypoallergenic", "blush", "eyeliner", "eyeshadow", "foundation", "lip_liner", "lipstick", "mascara")
            when "5"
                sub_menu("oil%20free", "foundation")
            when "6"
                sub_menu("organic", "blush", "bronzer", "eyeliner", "eyeshadow", "lipstick", "mascara")
            when "7"
                sub_menu("peanut%20free%20product", "lipstick")
            when "8"
                sub_menu("silicone%20free", "foundation")
            when "9"
                sub_menu("sugar%20free", "nail_polish")
            when "10"
                sub_menu("vegan", "blush", "bronzer", "eyeliner", "eyeshadow", "foundation", "lip_liner", "lipstick", "mascara", "nail_polish")
            when "bag"
                Bag.view_bag
                modify_bag
            when "menu"
                call
            when "exit"
                goodbye
            else
                puts "Not sure what you want? Type menu for the tags or exit to close application."
            end
        end
    end

    def modify_bag
        input = nil
        while input != "menu"
            input = gets.strip
            system("clear")
            case input
            when "menu"
                call
            when "clear"
                Bag.empty
            else
                Bag.remove(input)
            end
        end
    end

    def sub_menu(tag, product1=nil, product2=nil, product3=nil, product4=nil, product5=nil, product6=nil, product7=nil, product8=nil, product9=nil)
        list(tag)
        input = nil
        while input != "back"
            input = gets.strip.downcase
            system("clear")
            case input
            when "1"
                item_menu(tag, product1)
            when "2"
                item_menu(tag, product2)
            when "3"
                item_menu(tag, product3)
            when "4"
                item_menu(tag, product4)
            when "5"
                item_menu(tag, product5)
            when "6"
                item_menu(tag, product6)
            when "7"
                item_menu(tag, product7)
            when "8"
                item_menu(tag, product8)
            when "9"
                item_menu(tag, product9)
            else
                puts "Select a number or type back to go back to main menu"
            end
        end
        call
    end

    def item_menu(tag, product_type)
        products(tag, product_type)
        input = gets.strip
        if input != "back"
            save_item(tag, product_type, input)
        end
        call
    end

    def save_item(tag, product_type, input)
        system("clear")
        links = Bag.add_item(tag, product_type)
        adjusted_input = input.to_i - 1
        Bag.all << links[adjusted_input]
        puts "#{@@grn}Item has been saved to your favorites!\n\n\nReturning to main menu...#{@@white}"
        sleep(3)
    end

    def product_type_prompt
        puts ""
        puts "#{@@grn}Enter number corresponding with product type you want to browse or type back to return to main menu.#{@@white}\n\n"
    end

    def list(tag)
        search = Api.search_endpoint(tag)
        product_types = search.collect {|item| item["product_type"]}
        list = product_types.uniq
        list.sort!
        product_type_prompt
        list.each_with_index do |list_item, i| 
            if list_item == "lip_liner"
                list_item = "lip liner"
            elsif list_item == "nail_polish"
                list_item = "nail polish"
            end
            puts "#{i + 1}. #{list_item.capitalize}"
        end
    end

    def products(tag, product_type)
        search = Api.search_endpoint(tag)
        items = search.select {|item| item["product_type"] == "#{product_type}"}
        star = "*" * 50
        items.each_with_index do |item, i|
            puts "\n#{@@bwhite}#{star}#{@@white}\n\n\n#{i + 1}. #{@@pur}#{item["name"]} by #{item["brand"].capitalize}\n\n#{@@white}#{item["description"]}\n\nTags: #{item["tag_list"].join(", ")}\n\nLink: #{@@ublue}#{item["product_link"]}#{@@white}\n\n\n"
        end    
        puts "#{@@grn}Type number corresponding to item you wish to add to your bag or type back to return to main menu.#{@@white}"
    end

    def goodbye
        puts "#{@@grn}𝑨𝒍𝒘𝒂𝒚𝒔 𝒇𝒐𝒖𝒏𝒅 𝒖𝒏𝒊𝒒𝒖𝒆𝒍𝒚 𝒇𝒐𝒓 𝒚𝒐𝒖#{@@white}"
    end
end