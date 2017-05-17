# * The year is evenly divisible by 4
# * If the year can be evenly divided by 100, it is *not* a leap year.
# * If the year can be evenly divided by 400, it is a leap year.

class LeapYear
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def leap_year?
    if year % 4 != 0
      false
    elsif year % 400 == 0
      true
    elsif year % 100 == 0
      false
    else
      true
    end
  end
end

LeapYear.new(2000).leap_year?


# Next x years that are going to be leap years
require 'date'

year = Date.today.year

leap_years = []
x = 25

until leap_years.count == x
  if year % 4 != 0
    # do nothing
  elsif year % 400 == 0
    leap_years << year
  elsif year % 100 == 0
    # do nothing
  else
    leap_years << year
  end
  year += 1
end

puts leap_years
