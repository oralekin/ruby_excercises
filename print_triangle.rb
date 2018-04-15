def printchars(char, iter)
  (1..iter).each {|_|
    print(char)
  }
end

def print_triangle(height)
  height = height.round

  if height >= 0
    iterable = 1..(height)
  else
    iterable = (height)..-1
  end

  iterable.each {|row|
    printchars("*", row.abs)
    puts "\n"
  }
end

if __FILE__ == $PROGRAM_NAME
  print_triangle(1)
  puts "\n\n\n"
  print_triangle(5)
  puts "\n\n\n"
  print_triangle(-3)
end
