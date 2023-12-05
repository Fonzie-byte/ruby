=begin

               user         system   total      real
1 000 items:     0.066253   0.000397   0.066650 (  0.068404)
10 000 items:    6.571385   0.025747   6.597132 (  6.632196)
100 000 items: 669.477030   1.769516 671.246546 (671.959993)

=end

def bubble_sort(list)
  return list if list.size <= 1 # already sorted
  swapped = true
  while swapped do
    swapped = false
    0.upto(list.size-2) do |i|
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i] # swap values
        swapped = true
      end
    end
  end

  list
end
