class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(data, next_node=nil)
    @datum = data
    @next  = next_node
  end
end
  
class SimpleLinkedList
  def initialize(data=nil)
    @head = nil
    if data
      build_list(data)
    end
  end

  def has_head?
    !!@head
  end

  def build_list(data)
    previous_element = nil
    data.each do |x|
      if has_head?
        previous_element.next = Element.new(x)
        previous_element = previous_element.next
      else
        @head = Element.new(x)
        previous_element = @head
      end
    end
  end

  def push(element)
    if has_head?
      last.next = element
    else
      @head = element
    end
    self
  end

  def last
    node = @head
    while node.next do
      node = node.next
    end
    node
  end

  def pop
    if empty?
      return nil
    end

    node = @head
    previous_node = @head
    while node.next do
      previous_node = node
      node = node.next
    end
    previous_node.next = nil
    node
  end

  def empty?
    !@head
  end

  def to_a
    result = []
    node = @head
    while node do
      result.prepend(node.datum)
      node = node.next
    end
    result
  end

  def reverse!
    if !has_head?
      return self
    end

    previous = nil
    current = @head
    next_node = nil

    while current do
      next_node = current.next
      current.next = previous
      previous = current
      current = next_node
    end
    @head = previous
    self
  end
end