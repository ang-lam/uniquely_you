class CLI
    @@grn="\e[1;32m"
    @@white="\e[0m"
    @@ublue="\e[4;34m"
    @@pur="\e[1;35m"
    @@whiteback="\e[47m"
    @@bwhite="\e[1;37m"
    @@available_products_by_tag = ""
    
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
        puts "\n#{@@grn}Select a tag to browse by entering the number corresponding with the tag or type 'exit' to close application.\n\nType 'bag' to view your favorited items.#{@@white}\n\n"
        TAGS.each_with_index {|list_item, i| puts "#{i + 1}. #{list_item}"}
    end

    def menu
        input = gets.strip.downcase
        int_input = Integer(input) rescue false
        system("clear")
        if int_input && input.to_i <= 10 && input.to_i > 0
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
            end
        elsif input == "bag"
            Bag.view_bag
            modify_bag
        elsif input == "exit"
            goodbye
        else
            call
        end
    end

    def sub_menu(tag, type1=nil, type2=nil, type3=nil, type4=nil, type5=nil, type6=nil, type7=nil, type8=nil, type9=nil)
        type_list = get_products_type_by_tag(tag)
        input = gets.strip.downcase
        int_input = Integer(input) rescue false
        system("clear")
        if int_input && input.to_i <= type_list.count && input.to_i > 0
            case input
            when "1"
                product_type_menu(type1)
            when "2"
                product_type_menu(type2)
            when "3"
                product_type_menu(type3)
            when "4"
                product_type_menu(type4)
            when "5"
                product_type_menu(type5)
            when "6"
                product_type_menu(type6)
            when "7"
                product_type_menu(type7)
            when "8"
                product_type_menu(type8)
            when "9"
                product_type_menu(type9)
            end
        elsif input == "menu"
            call
        else
            sub_menu(tag, type1, type2, type3, type4, type5, type6, type7, type8, type9)
        end
    end

    def product_type_menu(type)
        product_list = get_products(type)
        input = gets.strip.downcase
        int_input = Integer(input) rescue false
        system("clear")
        if int_input && input.to_i <= product_list.count && input.to_i > 0
            save_item(input)
            call
        elsif input == "menu"
            call
        else
            product_type_menu(type)
        end
    end

    def get_products(type)
        product_list = Product.get_products_by_type(@@available_products_by_tag, type)
        sorted_product_list = product_list.sort_by {|item| item.name}
        star = "*" * 100
        sorted_product_list.each_with_index {|item, i| puts "\n#{@@bwhite}#{star}#{@@white}\n\n\n#{i + 1}. #{@@pur}#{item.name} by #{item.brand}\n\n#{@@white}#{item.description.wrap 100}\n\nTags: #{item.tags.join(", ")}\n\nLink: #{@@ublue}#{item.link}#{@@white}\n\n\n"}
        puts "#{@@grn}Enter number corresponding to item you wish to add to your bag or type 'menu' to return to main menu.#{@@white}"
        sorted_product_list
    end

    def save_item(input)
        system("clear")
        links = @@available_products_by_tag[input.to_i - 1].link
        Bag.all << links
        puts "#{@@grn}Item has been saved to your favorites!\n\n\nReturning to main menu...#{@@white}"
        sleep(3)  
    end

    def modify_bag
        input = nil
        while input != "menu"
            input = gets.strip
            int_input = Integer(input) rescue false
            system("clear")
            if int_input && input.to_i <= Bag.item_count && input.to_i > 0
                Bag.remove(input)
            elsif input == "menu"
                call
            elsif input == "clear"
                Bag.empty
            else
                Bag.view_bag
            end
        end
    end

    def get_products_type_by_tag(tag)
        results = Api.search_endpoint(tag)
        @@available_products_by_tag = results.collect {|item| Product.new(item)}
        product_list = Product.get_product_type_names(@@available_products_by_tag)
        product_list = product_list.uniq.sort!
        puts "\n#{@@grn}Enter number corresponding with product type you want to browse or type 'menu' to return to main menu.#{@@white}\n\n"
        product_list.each_with_index do |list_item, i| 
            if list_item == "lip_liner"
                list_item = "lip liner"
            elsif list_item == "nail_polish"
                list_item = "nail polish"
            end
            puts "#{i + 1}. #{list_item.capitalize}"
        end
    end

    def goodbye
        puts "#{@@grn}𝑨𝒍𝒘𝒂𝒚𝒔 𝒇𝒐𝒖𝒏𝒅 𝒖𝒏𝒊𝒒𝒖𝒆𝒍𝒚 𝒇𝒐𝒓 𝒚𝒐𝒖#{@@white}"
    end
end