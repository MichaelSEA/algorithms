def quicksort(array)
  return array if array.size <= 1
  
  less_than_pivot = []
  greater_than_pivot = []
  
  pivot_value = array.pop
  
  array.each do |item|
    less_than_pivot << item if item <= pivot_value
    greater_than_pivot << item if item > pivot_value
  end
  
  return quicksort(less_than_pivot) + [pivot_value] + quicksort(greater_than_pivot)
end

unsorted_array = (1..100).to_a.shuffle

puts unsorted_array.inspect
puts quicksort(unsorted_array)
