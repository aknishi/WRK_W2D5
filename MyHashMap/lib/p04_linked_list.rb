class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
    
    @next = nil
    @prev = nil
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head.next unless @head.next == @tail
    nil
  end

  def last
    return @tail.prev unless @tail.prev == @head
    nil
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
     el = Node.new(key,val)
     @tail.prev.next = el
     el.next = @tail
     el.prev = @tail.prev
     @tail.prev = el
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    return unless include?(key)
    each do |node|
      node.remove if node.key == key
    end
    
  end

  def each(&blk)
    el = first
    return if el == nil
    while el.next != nil
      blk.call(el)
      el = el.next
      return if el == nil
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
