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


    def my_rotate(int=1)
        new_arr=self.dup
        if int>0
            int.times do 
                new_arr<<new_arr.shift
            end
        else 
            
            int.abs.times do 
                new_arr.unshift(new_arr.pop)
            end
        end
        new_arr
    end    

    def my_join(sap='')
        str=''
        self.each_with_index { |ele,idx| str+= (idx<self.length-1) ? ele+ sap :  ele}
        str
    end


    def my_reverse()
        new_arr = []
        self.each {|ele| new_arr.unshift(ele)}
        new_arr
    end

end 








