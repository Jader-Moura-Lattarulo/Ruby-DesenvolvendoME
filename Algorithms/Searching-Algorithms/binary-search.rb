def binary_search(array, left_index, right_index, wanted)
    while left_index <= right_index
        midle = left_index + (right_index - left_index) / 2

        if array[midle] == wanted
            return midle
        end

        if array[midle] < wanted
            left_index = midle + 1
        else
            right_index = midle - 1
        end
    end

    return -1
end

print "Qual elemento você quer buscar na array? "
user_answer = gets.chomp.to_i

if __FILE__ == $PROGRAM_NAME
    array = [2, 3, 4, 10, 40]
    wanted = user_answer

    result = binary_search(array, 0, array.length - 1, wanted)
    if result != -1
        puts "Elemento #{wanted} foi encontrado no index #{result}"
        puts "Portanto está na posição #{result +1}"
    else
        puts "Elemento #{wanted} não está nessa array"
    end
end