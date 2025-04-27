module Enumerable
  def my_each_with_index
    count=-1
    self.each do|elem|
      count+=1
      yield(elem, count)
    end
    return self
  end

  def my_select(&my_block)
    output=[]
    self.each do |elem|
      output.push(elem) if my_block.call(elem)==true
    end
    return output
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    self.each do |elem|
      yield(elem)
    end
    return self
  end
end
