class RGB
  attr_reader :hex, :r, :g, :b

  def initialize(hex)
    @hex = hex
    @r   = hex.slice(0, 2).to_i(16)
    @g   = hex.slice(2, 2).to_i(16)
    @b   = hex.slice(4, 2).to_i(16)
  end

  def max_color
    return "Red" if r > g && r > b
    return "Green" if g > r && g > b
    return "Blue" if b > r && b > g
    return "There's some sort of tie"
  end
end

r = RGB.new("F6336A").max_color
puts r
puts "Expect Red: #{RGB.new("FF0000").max_color}"
puts "Expect Green: #{RGB.new("00FF00").max_color}"
puts "Expect Blue: #{RGB.new("0000FF").max_color}"
puts "Expect Tie: #{RGB.new("00FFFF").max_color}"
