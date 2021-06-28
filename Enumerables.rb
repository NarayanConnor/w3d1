require "byebug"
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

    [nil, nil]

    def my_zip(*arr)
        zip = Array.new(self.length)  {Array.new()}
        self.each_with_index do |ele, idx|
            zip[idx] << ele 
            arr.each do |arg|
                zip[idx] << arg[idx]
            end

            while zip[idx].length < zip[0].length
                zip[idx] << nil
            end

        end
        zip
    end


end    


a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d) # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]








