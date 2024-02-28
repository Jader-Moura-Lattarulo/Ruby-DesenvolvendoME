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

            visited[vertex_2] = true
            result << [vertex_1, vertex_2, weight]

            @graph[vertex_2].each {|vertex, weight| min_heap, insert([vertex_2, vertex, weight]) unless visited[vertex]}
        end

        result
    end

    def kruskal
        result = []
        edges = []

        @graph.each do |vertex_1, neighbors|
            neighbors.each{|vertex_2, weight| edges << [vertex_1, vertex_2, weight]}
        end

        edges = edges.sort_by{|edge| edge[2]}

        parent = Array.new(@vertex) { |i| i }
        rank = Array.new(@vertex, 0)

        edges.each do |edge|
            vertex_1, vertex_2, weight = edge
            x = find(parent, vertex_1)
            y = find(parent, vertex_2)

            if x != y
                result << [vertex_1, vertex_2, weight]
                union(parent, rank, x, y)
            end

        end

        result
    end

    private

    def find(parent, i)
        if parent[i] == i
            i
        else
            find(parent,parent[i])
        end
    end

    def union(parent, rank, x, y)
        xroot = find(parent, x)
        yroot = find(parent, y)

        if rank[xroot] < rank[yroot]
            parent[xroot] = yroot

        elsif rank[xroot] > rank[yroot]

end