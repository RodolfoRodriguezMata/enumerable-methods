# frozen_string_literal: true

module Enumerable

  def my_each
    return to_enum unless block_given?

    array = is_a?(Range) ? to_a : self
    counter = 0
    while counter < array.length
      yield(array[counter])
      counter += 1
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    array = is_a?(Range) ? to_a : self
    index = 0
    while index < array.length
      yield(array[index], index)
      index += 1
    end
  end

  def my_select
    return to_enum unless block_given?

    arr_to_r = []
    my_each { |x| arr_to_r << x if yield (x) }
    arr_to_r
  end

  def my_all? (pattern = nil)
    if block_given?
      my_each { |x| return false unless yield(x) }
    elsif pattern.class == Class
      my_each { |x| return false unless x.is_a? pattern }
    elsif pattern.class == Regexp
      my_each { |x| return false unless x.match? pattern }
    elsif !pattern.nil?
      my_each { |x| return false unless x == pattern }
    else
      my_each { |x| return false unless x }
    end
    true
  end

  def my_any? (pattern = nil)
    if block_given?
      my_each { |x| return true if yield(x) }
    elsif pattern.class == Class
      my_each { |x| return true if x.is_a? pattern }
    elsif pattern.class == Regexp
      my_each { |x| return true if x.match? pattern }
    elsif !pattern.nil?
      my_each { |x| return true if x == pattern }
    else
      my_each { |x| return true if x }
    end
    false
  end

  def my_none? (pattern = nil)
    if block_given?
      my_each { |x| return false if yield(x) }
    elsif pattern.class == Class
      my_each { |x| return false if x.is_a? pattern }
    elsif pattern.class == Regexp
      my_each { |x| return false if x.match? pattern }
    elsif !pattern.nil?
      my_each { |x| return false if x == pattern}
    else
      my_each { |x| return false if x }
    end
    true
  end

  def my_count (pattern = nil)
    counter = 0
    if block_given?
      my_each { |x| counter += 1 if yield(x) }
    elsif !pattern == nil
      my_each { |x| counter += 1 if x == pattern }
    else
     my_each { counter += 1 }
    end
    counter
  end

  def my_map
    return to_enum unless block_given?
    arr_to_r = []
    if block
      my_each_with_index { | x, i | arr_to_r[i] = block.call(x) }
    else
      my_each_with_index { | x, i | arr_to_r[i] = yield(x) }
    end
    arr_to_r
  end

  def my_inject

  end

end