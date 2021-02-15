class Show
    def initialize
        find
    end

    def all
        puts "There are #{Representative.all.count} representatives"
        Representative.all.each do |rep|
            puts "Name: #{rep.name}, District: #{rep.district}, Assets: #{rep.assets.count}"
        end
    end

    def find(id = 1)
        rep = Representative.find(id)
        puts rep.inspect
        puts rep.assets.inspect
        binding.pry
    end

    def richest_representative
        result = Representative.richest_rep
        puts "Finding rep with biggest investments...\n\n\n"
        puts "Total assets #{result[4]}\n"
        puts "DB id: #{result[0]}\n"
        puts "Name: #{result[1]}\n"
        puts "References: #{result[2].join(' ,')}\n"
        puts "Investment names: #{result[3].join("\n")}\n"
    end
end

Show.new