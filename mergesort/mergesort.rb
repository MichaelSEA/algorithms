#!/usr/bin/env ruby

# return the number of inversions necessary to mergesort an array of
# 100,000 random integers
#
@number_of_inversions = 0
INPUT_FILE =  "listofnums.txt"
@list_of_nums = []

def mergesort(list)
  return list if list.size <= 1
  mid = list.size / 2
  left  = list[0, mid]
  right = list[mid, list.size-mid]
  merge(mergesort(left), mergesort(right))
end
 
def merge(left, right)

  sorted = []
  until left.empty? or right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
      @number_of_inversions += 1 # this is wrong. TODO: figure out num to add... (midArray - i)
    end
  end
  sorted.concat(left).concat(right)
end

File.open(INPUT_FILE, "r") do |f|
  f.each do |line|
    @list_of_nums << line.to_i  
  end
end

mergesort @list_of_nums
puts "mergesort for this list of randomm numbers results in #{@number_of_inversions} inversions"
