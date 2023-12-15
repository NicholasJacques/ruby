require 'minitest/autorun'
require_relative 'two_bucket'
require 'pry'

class TwoBucketTest < Minitest::Test
  def test_measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5_start_with_bucket_one
    # skip
    subject = TwoBucket.new(3, 5, 1, "one")
    assert_equal 4, subject.moves
    assert_equal "one", subject.goal_bucket
    assert_equal 5, subject.other_bucket
  end

  def test_measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5_start_with_bucket_two
    # skip
    subject = TwoBucket.new(3, 5, 1, "two")
    assert_equal 8, subject.moves
    assert_equal "two", subject.goal_bucket
    assert_equal 3, subject.other_bucket
  end

  def test_measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11_start_with_bucket_one
    # skip
    subject = TwoBucket.new(7, 11, 2, "one")
    assert_equal 14, subject.moves
    assert_equal "one", subject.goal_bucket
    assert_equal 11, subject.other_bucket
  end

  def test_measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11_start_with_bucket_two
    # skip
    subject = TwoBucket.new(7, 11, 2, "two")
    assert_equal 18, subject.moves
    assert_equal "two", subject.goal_bucket
    assert_equal 7, subject.other_bucket
  end

  def test_measure_one_step_using_bucket_one_of_size_1_and_bucket_two_of_size_3_start_with_bucket_two
    # skip
    subject = TwoBucket.new(1, 3, 3, "two")
    assert_equal 1, subject.moves
    assert_equal "two", subject.goal_bucket
    assert_equal 0, subject.other_bucket
  end

  def test_measure_using_bucket_one_of_size_2_and_bucket_two_of_size_3_start_with_bucket_one_and_end_with_bucket_two
    # skip
    subject = TwoBucket.new(2, 3, 3, "one")
    assert_equal 2, subject.moves
    assert_equal "two", subject.goal_bucket
    assert_equal 2, subject.other_bucket
  end

  def test_with_the_same_buckets_but_a_different_goal_then_it_is_possible
    # skip
    subject = TwoBucket.new(6, 15, 9, "one")
    assert_equal 10, subject.moves
    assert_equal "two", subject.goal_bucket
    assert_equal 0, subject.other_bucket
  end
end

class BucketTest < Minitest::Test
  def test_pour_into
    # skip
    [
      [[Bucket.new(3), Bucket.new(2), 3, 0], [1, 2]],
      [[Bucket.new(3), Bucket.new(2), 3, 2], [3, 2]],
      [[Bucket.new(3), Bucket.new(4), 3, 0], [0, 3]],
      [[Bucket.new(3), Bucket.new(4), 3, 2], [1, 4]],
      [[Bucket.new(5), Bucket.new(3), 2, 0], [0, 2]],
    ].each do |(bucket_1, bucket_2, fill_level_1, fill_level_2), (expected_fill_level_1, expected_fill_level_2)|
      bucket_1.fill_level = fill_level_1
      bucket_2.fill_level = fill_level_2
      
      bucket_1.pour_into(bucket_2)
      assert_equal expected_fill_level_1, bucket_1.fill_level
      assert_equal expected_fill_level_2, bucket_2.fill_level
    end
  end
end