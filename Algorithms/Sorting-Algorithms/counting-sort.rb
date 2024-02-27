def count_sort(input_array)
    max_element = input_array.max
    count_array = [0] * (max_element + 1)
    
    input_array.each { |index| count_array[index] += 1 }
    (1..max_element).each { |i| count_array[i] += count_array[i - 1] }

    output_array = Array.new(input_array.length)

    (input_array.length - 1).downto(0) do |index|
        output_array[count_array[input_array[index]] - 1] = input_array[index]
        count_array[input_array[index]] -= 1

        puts "Passo #{input_array.length - index}: #{output_array.join(', ')}"
        sleep(2)
    end

    return output_array
end

if __FILE__ == $PROGRAM_NAME
    puts "Digite os elementos do array separados por vírgula: "
    user_input = gets.chomp
    
    input_array = user_input.split(',').map(&:to_i)
    output_array = count_sort(input_array)

    puts "Array ordenado:"
    output_array.each { |num| print "#{num} "}
    puts
end
