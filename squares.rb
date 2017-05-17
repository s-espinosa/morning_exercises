# Natural number from 1 to some number
# First get the sum of the squares (e.g. 1 squared, plus 2 squared, plus 3 squared...)
# Then get the square of the sums (e.g. 1 + 2 + 3 etc. squared)
# Then get the difference between the two. Difference should be a positive number.


# First pass

numbers =* 1..100

sum_of_squares = numbers.reduce(0) do |sum, current|
  sum += current ** 2
end

square_of_sums = (numbers.reduce(:+)) ** 2

puts square_of_sums - sum_of_squares

# In a class

class SumOfSquares
  def initialize(num)
    @range =* 1..num
  end

  def calculate
    square_of_sums - sum_of_squares
  end

  private

  def square_of_sums
    @range.reduce(:+) ** 2
  end

  def sum_of_squares
    @range.reduce(0) do |sum, current|
      sum += current ** 2
    end
  end
end

sum_of_squares = SumOfSquares.new(100)
puts sum_of_squares.calculate

# Without reduce

class SumOfSquaresV2
  def initialize(num)
    @range =* 1..num
  end

  def calculate
    square_of_sums - sum_of_squares
  end

  private

  def square_of_sums
    sum = 0
    @range.each do |number|
      sum += number
    end
    sum ** 2
  end

  def sum_of_squares
    sum = 0
    @range.each do |number|
      sum += number ** 2
    end
    sum
  end
end

sum_of_squares_v2 = SumOfSquaresV2.new(100)
puts sum_of_squares_v2.calculate

# Without reduce refactored

class SumOfSquaresV3
  def initialize(num)
    @range =* 1..num
  end

  def calculate
    square_of_sums - sum_of_squares
  end

  private

  def square_of_sums
    sum = sum_array(@range)
    sum ** 2
  end

  def sum_of_squares
    squares = @range.map do |number|
      number ** 2
    end
    sum_array(squares)
  end

  def sum_array(array)
    sum = 0
    array.each do |number|
      sum += number
    end
    sum
  end
end

sum_of_squares_v3 = SumOfSquaresV3.new(100)
puts sum_of_squares_v3.calculate
