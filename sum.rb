# @param [Float] arr Array of numbers to be added
def sum(arr)
  ret = 0.0
  arr.each {|elem|
    ret = ret+elem
  }
  ret
end

if __FILE__ == $PROGRAM_NAME
  p sum([1, 2, 3]) == 6
  p sum([-1, 1, 3]) == 3
  p sum([1, 6, 2]) == 9
  p sum([1, 2, 2]) == 5.0
  p sum([1.40, 4.31, 6.2]) == 11.91
end
