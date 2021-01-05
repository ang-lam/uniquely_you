# CLI CONTROLLER

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
        puts "
        ▒█░▒█ █▀▀▄ ░▀░ █▀▀█ █░░█ █▀▀ █░░ █░░█ 　 ▒█░░▒█ █▀▀█ █░░█ 
        ▒█░▒█ █░░█ ▀█▀ █░░█ █░░█ █▀▀ █░░ █▄▄█ 　 ▒█▄▄▄█ █░░█ █░░█ 
        ░▀▄▄▀ ▀░░▀ ▀▀▀ ▀▀▀█ ░▀▀▀ ▀▀▀ ▀▀▀ ▄▄▄█ 　 ░░▒█░░ ▀▀▀▀ ░▀▀▀
        "
        list_tags
        menu
        goodbye
    end

    def save_item(tag, product_type, input)
        links = Bag.add_item(tag, product_type)
        adjusted_input = input.to_i - 1
        Bag.all << links[adjusted_input]
    end

    def list_tags
        puts "\n#{@@grn}Select a tag to browse by entering the number corresponding with the tag or type exit to close application:#{@@white}\n\n"
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
                list("alcohol%20free")
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("alcohol%20free", "foundation")
                        while input != "back"
                            input = gets.strip
                            system("clear")   
                            save_item("alcohol%20free", "foundation", input)
                        end
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "2"
                list("chemical%20free")
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("chemical%20free", "lipstick")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "3"
                list_with_lipliner("cruelty%20free", 1)
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("cruelty%20free", "foundation")
                    when "2"
                        products("cruelty%20free", "lip_liner")
                    when "3"
                        products("cruelty%20free", "lipstick")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "4"
                list_with_lipliner("hypoallergenic", 4)
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("hypoallergenic", "blush")
                    when "2"
                        products("hypoallergenic", "eyeliner")
                    when "3"
                        products("hypoallergenic", "eyeshadow")
                    when "4"
                        products("hypoallergenic", "foundation")
                    when "5"
                        products("hypoallergenic", "lip_liner")
                    when "6"
                        products("hypoallergenic", "lipstick")
                    when "7"
                        products("hypoallergenic", "mascara")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "5"
                list("oil%20free")
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("oil%20free", "foundation")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "6"
                list("organic")
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("organic", "blush")
                    when "2"
                        products("organic", "bronzer")
                    when "3"
                        products("organic", "eyeliner")
                    when "4"
                        products("organic", "eyeshadow")
                    when "5"
                        products("organic", "lipstick")
                    when "6"
                        products("organic", "mascara")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "7"
                list("peanut%20free%20product")
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("peanut%20free%20product", "lipstick")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "8"
                list("silicone%20free")
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("silicone%20free", "foundation")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "9"
                list_with_nailpolish("sugar%20free")
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("sugar%20free", "nail_polish")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "10"
                list_with_lipliner_nailpolish("vegan", 5, 8)
                while input != "back"
                    input = gets.strip.downcase
                    system("clear")
                    case input
                    when "1"
                        products("vegan", "blush")
                    when "2"
                        products("vegan", "bronzer")
                    when "3"
                        products("vegan", "eyeliner")
                    when "4"
                        products("vegan", "eyeshadow")
                    when "5"
                        products("vegan", "foundation")
                    when "6"
                        products("vegan", "lip_liner")
                    when "7"
                        products("vegan", "lipstick")
                    when "8"
                        products("vegan", "mascara")
                    when "9"
                        products("vegan", "nail_polish")
                    else
                        puts "Select a number or type back to go back to main menu"
                    end
                end
                list_tags
            when "list"
                list_tags
            else
                puts "Not sure what you want? Type list for the tags or exit to close application."
            end
        end
    end

    def product_type_prompt
        puts ""
        puts "Enter number corresponding with product type you want to browse:"
    end

    def list(tag)
        search = Api.search_endpoint(tag)
        product_types = search.collect {|item| item["product_type"]}
        list = product_types.uniq
        list.sort!
        product_type_prompt
        list.each_with_index {|list_item, i| puts "#{i + 1}. #{list_item.capitalize}"}
    end

    def list_with_lipliner(tag, element)
        search = Api.search_endpoint(tag)
        product_types = search.collect {|item| item["product_type"]}
        list = product_types.uniq
        list.sort!
        list[element] = "lip liner"
        product_type_prompt
        list.each_with_index {|list_item, i| puts "#{i + 1}. #{list_item.capitalize}"}
    end

    def list_with_nailpolish(tag)
        search = Api.search_endpoint(tag)
        product_types = search.collect {|item| item["product_type"]}
        list = product_types.uniq
        list[0] = "nail polish"
        list.sort!
        product_type_prompt
        list.each_with_index {|list_item, i| puts "#{i + 1}. #{list_item.capitalize}"}
    end

    def list_with_lipliner_nailpolish(tag, lip_element, nail_element)
        search = Api.search_endpoint(tag)
        product_types = search.collect {|item| item["product_type"]}
        list = product_types.uniq
        list.sort!
        list[lip_element] = "lip liner"
        list[nail_element] = "nail polish"
        product_type_prompt
        list.each_with_index {|list_item, i| puts "#{i + 1}. #{list_item.capitalize}"}
    end

    def products(tag, product_type)
        search = Api.search_endpoint(tag)
        items = search.select {|item| item["product_type"] == "#{product_type}"}
        star = "*" * 50
        items.each_with_index do |item, i|
            puts "\n#{@@bwhite}#{star}#{@@white}\n\n\n#{i + 1}. #{@@pur}#{item["name"]} by #{item["brand"].capitalize}\n\n#{@@white}#{item["description"]}\n\nTags: #{item["tag_list"].join(", ")}\n\nLink: #{@@ublue}#{item["product_link"]}#{@@white}\n\n\n"
        end    
        puts "Type back to go back to main menu."
    end

    def goodbye
        puts "#{@@grn}𝑨𝒍𝒘𝒂𝒚𝒔 𝒇𝒐𝒖𝒏𝒅 𝒖𝒏𝒊𝒒𝒖𝒆𝒍𝒚 𝒇𝒐𝒓 𝒚𝒐𝒖#{@@white}"
    end
end