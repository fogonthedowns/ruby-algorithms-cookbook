## Table of Contents

Sorting algorithms

1. [Quicksort](#Quicksort)


## Quicksort
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