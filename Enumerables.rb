class Array

    def my_each(&prc)
        i=0
        while i< self.length
            prc.call(self[i])
            i+=1
        end

        self
    end

    def my_select(&prc)
        new_arr=[]
        i=0
        while i<self.length
            new_arr<<self[i] if prc.call(self[i])
            i+=1
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr=[]
        i=0
        while i<self.length

            new_arr<<self[i] if !prc.call(self[i])
            i+=1
        end
        new_arr
    end


    def my_any?(&prc)
        self.each{ |ele| return true if prc.call(ele) }
        false
    end

    def my_all?(&prc)
        self.each{ |ele| return false if !prc.call(ele)}
        return true
    end

    def my_flatten
        new_arr=[]
        
        self.each do |ele|
            if ele.is_a?(Array)
                new_arr+=ele.my_flatten
            else
                new_arr<<ele
            end
        end
        new_arr
    end

end    

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]








