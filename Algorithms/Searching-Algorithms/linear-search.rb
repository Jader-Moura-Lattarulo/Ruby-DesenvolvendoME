def search (array, array_length, wanted)
    for i in 0..array_length-1 do
        if array[i] == wanted
            return i
        end
    end
    return -1
end

print "Qual elemento você deseja obter o index? "
user_answer = gets.chomp.to_i

if __FILE__ == $PROGRAM_NAME
    array = [2, 3, 4, 10, 40]
    wanted = user_answer
    array_length = array.length

    result = search(array, array_length, wanted)
    if result == -1
        puts "Elemento não presente no array"
    else
        puts "Elemento encontrado no index #{result}"
        puts "Portanto está presente na posição #{result +1}"
    end
end