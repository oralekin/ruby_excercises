require_relative "./sum"

def mean(arr)
  sum(arr)/arr.length
end

if __FILE__ == $PROGRAM_NAME
  p mean([1, 2, 3]) == 2
  p mean([-1, 1, 3]) == 1
  p mean([1, 6, 2]) == 3
  p mean([1, 2, 2]) == 5.0/3.0
end

