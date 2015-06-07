## Table of Contents

Sorting algorithms

1. [Quicksort](#quicksort)
2. [Mergesort](#mergesort)


Graph algorithms

1. [Prim's Algorithm](prims_algorithm.rb)


## quicksort

The steps are:
  1. Pick an element, called a pivot, from the array.
  2. Reorder the array so that all elements with values less than the pivot come before the pivot, while all elements with values greater than the pivot come after it (equal values can go either way). After this partitioning, the pivot is in its final position. This is called the partition operation.
  3. Recursively apply the above steps to the sub-array of elements with smaller values and separately to the sub-array of elements with greater values.

```
class Array
  def quicksort
    return [] if empty?
    # 1
    pivot = delete_at(rand(size))
    # 2
    left, right = partition(&pivot.method(:>))
    # 3
    return *left.quicksort, pivot, *right.quicksort
  end
end
```


## mergesort
O(n log n)

1. Divide the unsorted list into n sublists, each containing 1 element (a list of 1 element is considered sorted).
2. Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.


```
class Array
  def merge_sort
    return self if self.length <= 1

    middle = (self.length / 2).to_i
    left = self[0..middle-1].merge_sort
    right = self[middle..self.length-1].merge_sort

    return merge(left, right)
  end

	def merge(left, right)
	  result = []
	 
	  while left.size > 0 && right.size > 0
	    result << if left[0] <= right[0]
	      left.shift
	    else
	      right.shift
	    end
	  end
	 
	  result.concat(left).concat(right)
	end
end
```
