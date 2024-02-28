class Graph
    def initialize (vertices)
        @vertices = vertices
        @graph = Hash.new { |hash, key| hash[key] = []}
    end 

    def add_edge (vertex_1, vertex_2, weight)
        @graph[vertex_1] << [vertex_2, weight]
        @graph[vertex_2] << [vertex_1, weight]
    end

    def prim
        visited = Array.new(@vertices, false)
        min_heap = MinHeap.new

        result = []

        start_vertex = 0
        visited[start_vertex] = true

        @graph[start_vertex].each { |vertex, weight| min_heap, insert([start_vertex, vertex, weight])}

        while !min_heap.empty?
            vertex_1, vertex_2, weight = min_heap.extract_min

            next if visited[vertex_2]

            visited[]


end