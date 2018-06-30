class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    flattened = self.dup.flatten
    result = 0
    flattened.each_with_index do |el, idx|
      result += ((el**idx).hash%self.length)    
    end
    result
  end
end

class String
  
  def hash
    result = 0
    str_chars = self.chars
    str_chars.each_with_index.map do |char,idx|
      result += ((char.ord**idx).hash%self.length)
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k,v|
      if k.is_a?(Symbol)
        result += (k.to_s.hash * v.hash).hash
      else
        result += k.hash
      end
    end
    result
  end
end
