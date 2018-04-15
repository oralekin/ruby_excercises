def max(a)
  max_val = a.first
  a.each {|val|
    if val > max_val
      max_val = val
    end
  }
end

if __FILE__ == $PROGRAM_NAME
  p max ([1, 2, 3]) == 3
  p max([0.23, 0.4312, 0.8674]) == 0.8674
  p max([-1, -2, -3]) == -1
end