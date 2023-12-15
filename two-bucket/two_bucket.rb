class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket
  
  def initialize(bucket_1, bucket_2, goal, starting_bucket)
    @first_bucket, @second_bucket = starting_bucket == "one" ? [Bucket.new(bucket_1), Bucket.new(bucket_2)] : [Bucket.new(bucket_2), Bucket.new(bucket_1)]
    @starting_bucket = starting_bucket
    @moves = 0
    @goal = goal
    @goal_bucket = nil
    @other_bucket = nil

    measure
  end

  private

  # def first_bucket
  #   @starting_bucket == "one" ? @bucket_one : @bucket_two
  # end

  # def second_bucket
  #   @starting_bucket == "one" ? @bucket_two : @bucket_one
  # end

  def measure
    until @first_bucket.fill_level == @goal || @second_bucket.fill_level == @goal
      @moves += 1
      if @first_bucket.empty?
        @first_bucket.fill
        next
      end
      if @second_bucket.capacity == @goal
        @second_bucket.fill
        next
      end
      if @first_bucket.full?
        @first_bucket.pour_into(@second_bucket)
        next
      end
      if !@first_bucket.empty? && @second_bucket.empty?
        @first_bucket.pour_into(@second_bucket)
        next
      end
      if @second_bucket.empty?
        @second_bucket.fill
        next
      end
      if @second_bucket.full?
        @second_bucket.empty
        next
      end
    end

    @goal_bucket, @other_bucket = (@first_bucket.fill_level == @goal) ? ["one", @second_bucket.fill_level] : ["two", @first_bucket.fill_level]
  end
end

class Bucket
  attr_reader :capacity
  attr_accessor :fill_level

  def initialize(capacity)
    @capacity = capacity
    @fill_level = 0
  end

  def fill
    @fill_level = @capacity
  end

  def full?
    @fill_level == @capacity
  end

  def empty
    @fill_level = 0
  end

  def empty?
    @fill_level == 0
  end

  def pour_into(other_bucket)
    recipient_available_capacity = other_bucket.available_capacity
    other_bucket.fill_level = [other_bucket.fill_level + @fill_level, other_bucket.capacity].min
    @fill_level = [@fill_level - recipient_available_capacity, 0].max
  end
  
  def available_capacity
    @capacity - @fill_level
  end
end