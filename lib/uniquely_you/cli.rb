# CLI CONTROLLER
require 'pry'
class CLI

    attr_accessor :api, :tags
    def call
        list_tags
        menu
        goodbye
    end

    def list_tags
        puts "Select a tag to browse or type list to look at tags or exit:"
        @tags = Tags.list
    end

    def menu
        input = nil
        while input != "exit"
            # gets.strip => takes user input from the console
            input = gets.strip.downcase
            case input
            when "1"
                alcohol_free = Api.search_endpoint("alcohol%20free")
                #can add pry within the when to run pry
                binding.pry
            when "2"
                puts "More info on tag 2"
            when "list"
                list_tags
            else
                puts "Not sure what you want? Type list or exit."
            end
        end
    end

    def goodbye
        puts "Always found uniquely for you!"
    end


end