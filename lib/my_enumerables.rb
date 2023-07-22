module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...self.length
      yield self[i], i
    end
    self
  end

  def my_select
    return_array = []
    self.my_each do |element|
      if yield element
        return_array << element
      end
    end
    return_array
  end

  def my_all?
    self.my_each do |element|
      unless yield element
        return false
      end
    end
    return true
  end

  def my_any?
    self.my_each do |element|
      if yield element
        return true
      end
    end
    return false
  end

  def my_none?
    self.my_each do |element|
      if yield element
        return false
      end
    end
    return true
  end

  def my_count
    count = 0
    self.my_each do |element|
      if block_given?
        count += 1 if yield element
      else
        count += 1
      end
    end
    count
  end

  def my_map
    return_array = []
    self.my_each do |element|
      result = yield element
      return_array << result
    end
    return_array
  end

  def my_inject(initial = 0)
    self.my_each do |element|
      initial = yield initial, element
    end
    initial
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end
end

array = [1, 2, 3, 4, 5]
array.my_each { |i| puts i }
array.my_each_with_index { |i, index| puts i + index }
