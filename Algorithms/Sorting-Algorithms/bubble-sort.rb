def bubble_sort(array)
    array_length = array.length

    for current_iteration in 0..array_length-1
        swapped = false

        for index in 0..array_length-current_iteration-2

            if array[index] > array[index+1]
                array[index], array[index+1] = array[index+1], array[index]
                swapped = true

                puts "Passo #{current_iteration + 1}, Troca #{index + 1}: "
                puts "#{array.join(', ')}"
            end
        end

        break unless swapped
    end
end

if __FILE__ == $PROGRAM_NAME

    puts "Digite os elementos do array separados por vírgula:"
    user_input = gets.chomp
    
    inputed_array = user_input.split(',').map(&:to_i)

    bubble_sort(inputed_array)

    print "Array ordenado: "
    inputed_array.each { |element| print "#{element} "}
    puts
end