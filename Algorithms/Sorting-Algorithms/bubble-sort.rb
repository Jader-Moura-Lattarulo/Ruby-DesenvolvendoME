def bubble_sort(array)
    array_length = array.length

    for current_iterarion in 0..array_length-1
        swapped = false

        for index in 0..array_length-current_iterarion-2

            if array[index] > array[index+1]
                array[index], array[index+1] = array[index+1], array[index]
                swapped = true
            end
        end

        break unless swapped
    end
end

