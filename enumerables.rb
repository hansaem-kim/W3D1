
class Array

    def my_each(&prc)
        i=0
        while i < self.length
            prc.call(self[i])
            i+=1
        end
        self
    end

    def my_select(&prc)
        new_array=[]
        self.my_each do |ele|
            new_array << ele if prc.call(ele)
        end
        return new_array
    end

    def my_reject(&prc)
        new_array=[]
        self.my_each do |ele|
            new_array << ele if !prc.call(ele)
        end
        new_array
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        element_string = self.join("")
        element_array = element_string.split("").map(&:to_i)
    end

    def my_zip(*args)
        new_array = []
        self.each.with_index do |ele, i|
            sub = [ele]
            args.each do |arg|
                sub << arg[i]
            end
            new_array << sub
        end
        new_array
    end

    def my_rotate(num=1)
        num.abs.times do
            if num > 0
                self.push(self.shift)
            else
                self.unshift(self.pop)
            end
        end
        self
    end 

    def my_join(separator="")
        new_string = ""
        self.each do |ele|
            new_string += ele + separator
        end
        new_string[0...-1]
    end

    def my_reverse
        new_array = []
        i=self.length-1
        while i >= 0
            new_array << self[i]
            i-=1
        end
        new_array
    end

end
