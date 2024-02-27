class Grafo
    def initialize(vertices_number)
        @vertices_number = vertices_number
        @edges = []
    end

    def add_edge(origin, destination, weight)
        @edges << [origin, destination, weight]
    end

    def encontrar(father, element)
        return father[element] if father[element] != element

        father[element] = find(father, father[element])
    end

    def join(father, classification, x, y)
        if classification[x] < classification[y]
            father[x] = y
        elsif classification[x] > classification[y]
            father[y] = x
        else
            father[y] = x
            classification[x] += 1
        end
    end

    def kruskal_mst
        result = []
        index_edge = 0
        index_result = 0

        @edges = @edges.sort_by { |edge| edge[2] }

        father = []
        classification = []

        (0...@vertices_number).each do |vertex|
            father << vertex
            classification << 0
        end

        while index_result < @vertices_number - 1
            origin, destination, weight = @edges[index_edge]
            index_edge += 1
            set_origin = find(father, origin)
            set_destination = find(father, destination)

            if set_origin != set_destination
            index_result += 1
            result << [origin, destination, weight]
            join(father, classification, set_origin, set_destination)
            end
        end

        
end