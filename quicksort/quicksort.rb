#!/usr/bin/env ruby

# The file contains all of the integers between 1 and 10,000 (inclusive) in unsorted order (with no integer repeated). 
# The integer in the ith row of the file gives you the ith entry of an input array.
#
# Your task is to compute the total number of comparisons used to sort the given input file by QuickSort. 
# As you know, the number of comparisons depends on which elements are chosen as pivots, so we'll ask you 
# to explore three different pivoting rules.
# You should not count comparisons one-by-one. Rather, when there is a recursive call on a subarray of length m, 
# you should simply add m−1 to your running total of comparisons. (This is because the pivot element will be 
# compared to each of the other m−1 elements in the subarray in this recursive call.)

# WARNING: The Partition subroutine can be implemented in several different ways, and different implementations 
# can give you differing numbers of comparisons. For this problem, you should implement the Partition subroutine 
# as it is described in the video lectures (otherwise you might get the wrong answer).

# DIRECTIONS FOR THIS PROBLEM:

# For the first part of the programming assignment, you should always use the first element of the array 
# as the pivot element.

INPUT_FILE =  "QuickSort.txt"
@unsorted_array = []
@comparisions = 0

def quicksort(array)
  return array if array.size <= 1

  less_than_pivot = []
  greater_than_pivot = []

  # pivot_value = array.shift # first element
  # pivot_value = array.pop # last element
  first_value = array.shift
  last_value = array.pop
  length = array.length
  middle_value = length.modulo(2) == 1? (length/2) + 1 : length
  pivot_value = [ first_value, middle_value, last_value ].min
 
  array.each do |item|
    less_than_pivot << item if item <= pivot_value
    greater_than_pivot << item if item > pivot_value
  end

  @comparisions += less_than_pivot.size-1 + greater_than_pivot.size-1
  return quicksort(less_than_pivot) + [pivot_value] + quicksort(greater_than_pivot)
end

File.open(INPUT_FILE, "r") do |f|
  f.each do |line|
    @unsorted_array << line.to_i
  end
end

# unsorted_array = (1..100).to_a.shuffle

# puts unsorted_array.inspect
quicksort(@unsorted_array)

puts "The number of comparisions is #{@comparisions}"

# with first element:  144692
# with last element:   149074
# with median-of-three:6080843

