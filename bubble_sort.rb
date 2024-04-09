def bubble_sort(arr)
  sorted_arr = []
  until arr == [] do
    arr.each_with_index do |num, index|
      if arr[index + 1] == nil
        sorted_arr.unshift(num)
        arr.pop
      elsif num > arr[index + 1]
        arr[index] = arr[index + 1]
        arr[index + 1] = num
      else
        next
      end
    end
  end
  puts "sorted array = #{sorted_arr}"
end

bubble_sort([4,3,78,2,0,2,1,4,])