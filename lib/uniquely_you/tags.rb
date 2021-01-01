require 'pry'
class Tags
    #attr_accessor for the attributes name, price, availability 
    
    TAGS = %W(Alcohol\ Free Chemical\ Free Cruelty\ Free Hypoallergenic Oil\ Free Organic Peanut\ Free\ Product Silicone\ Free Sugar\ Free Vegan)
    #call .all and get an array of the tags
    def self.list
        # puts <<-DOC.gsub /^\s*/, ''
        #     1. CertClean
        #     2. Chemical Free
        #     3. Dairy Free
        #     4. EWG Verified
        #     5. EcoCert
        #     6. Fair Trade

        # DOC
        TAGS.each_with_index do |list_item, i|
            puts "#{i + 1}. #{list_item}"
        end
        # puts "11. Search by product type"
    end
    # binding.pry
end