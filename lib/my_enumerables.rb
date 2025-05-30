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

  def my_all?(&my_block)
    output=true
    self.each do |elem|
      output=false if my_block.call(elem)==false
    end
    return output
  end

  def my_any?(&my_block)
    output=false
    self.each do |elem|
      output=true if my_block.call(elem)==true
    end
    return output
  end

  def my_none?(&my_block)
    output=true
    self.each do |elem|
      output=false if my_block.call(elem)==true
    end
    output
  end

  def my_count(&my_block)
    if block_given?
      count=0
      self.each do |elem|
        count+=1 if my_block.call(elem)==true
      end
      return count
    end
    return self.length
  end

  def my_map(&my_block)
    output=[]
    self.each do |elem|
      output.push(my_block.call(elem))
    end
    return output
  end

  def my_inject(init, &my_block)
    output=init
    self.each do |elem|
      output=my_block.call(output,elem)
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
