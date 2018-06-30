class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      if @count == num_buckets
        resize!
      end
      @store[(key.hash)%num_buckets] << key
      @count += 1
    end
  end

  def include?(key)
    @store.each do |bucket|
      bucket.each do |el|
        return true if el == key
      end
    end
    false
  end

  def remove(key)
    if include?(key)
      @store.each do |bucket|
        bucket.delete(key)
      end
      @count-=1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |el|
       new_store[el % (num_buckets*2)] << el
     end
   end
   @store = new_store
   end
end
