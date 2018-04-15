require_relative "print_triangle"

def print_pyramid(h)
  print_triangle h
  print_triangle 1 - h
end

if __FILE__ == $PROGRAM_NAME
  print_pyramid(4)
  puts "\n\n\n"
  print_pyramid(5)
  puts "\n\n\n"
  print_pyramid(15)
end
