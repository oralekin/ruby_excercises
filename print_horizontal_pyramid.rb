require_relative "print_triangle"

def print_horizontal_pyramid(height)
  height = height.round
  base = (height * 2).abs - 1

  if height >= 0
    iterable = 1..(height)
  else
    iterable = (height)..-1
  end

  iterable.each {|row|
    # spaces before the stars
    printchars " ", (base - (2 * row.abs - 1)) / 2
    # stars
    printchars "*", (2 * row.abs - 1)
    # spaces after stars
    printchars " ", (base - (2 * row.abs - 1)) / 2
    print "\n"
  }
end

if __FILE__ == $PROGRAM_NAME
  print_horizontal_pyramid 5
  print "\n\n\n"
  print_horizontal_pyramid -5
  print "\n\n\n"
  print_horizontal_pyramid 4.7
end
