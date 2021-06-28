

def factors(num)
    potential = (1...num).to_a
    potential.select {|ele| num % ele == 0}
end

class Array
    def bubble_sort!(&prc)
        run = false

        while !run
            run = true
            self.each_with_index do |ele, i|
                if prc.call(ele, self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    run = false
                end
            end
        end
        self
    end
end


p [4,3,2,1, -10].bubble_sort! {|k, v| v <=> k}
# p factors(24)
# p factors(13)