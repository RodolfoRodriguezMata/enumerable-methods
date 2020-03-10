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

  end

  def my_select

  end

  def my_all?

  end

  def my_any?

  end

  def my_none?

  end

  def my_count

  end

  def my_map

  end

  def my_inject

  end

end