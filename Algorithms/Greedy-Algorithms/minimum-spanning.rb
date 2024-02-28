class Graph
    def initialize(vertices)
      @vertices = vertices
      @graph = Hash.new { |hash, key| hash[key] = [] }
    end
  
    def add_edge(vertex_1, vertex_2, weight)
      @graph[vertex_1] << [vertex_2, weight]
      @graph[vertex_2] << [vertex_1, weight]
    end
  
    def prim
      visited = Array.new(@vertices, false)
      min_heap = MinHeap.new
  
      result = []
  
      start_vertex = 0
      visited[start_vertex] = true
  
      @graph[start_vertex].each { |vertex, weight| min_heap.insert([start_vertex, vertex, weight]) }
  
      while !min_heap.empty?
        vertex_1, vertex_2, weight = min_heap.extract_min
  
        next if visited[vertex_2]
  
        visited[vertex_2] = true
        result << [vertex_1, vertex_2, weight]
  
        @graph[vertex_2].each { |vertex, weight| min_heap.insert([vertex_2, vertex, weight]) unless visited[vertex] }
      end
  
      result
    end
  
    def kruskal
      result = []
      edges = []
  
      @graph.each do |vertex_1, neighbors|
        neighbors.each { |vertex_2, weight| edges << [vertex_1, vertex_2, weight] }
      end
  
      edges = edges.sort_by { |edge| edge[2] }
  
      parent = Array.new(@vertices) { |i| i }
      rank = Array.new(@vertices, 0)
  
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
        find(parent, parent[i])
      end
    end
  
    def union(parent, rank, x, y)
      xroot = find(parent, x)
      yroot = find(parent, y)
  
      if rank[xroot] < rank[yroot]
        parent[xroot] = yroot
      elsif rank[xroot] > rank[yroot]
        parent[yroot] = xroot
      else
        parent[yroot] = xroot
        rank[xroot] += 1
      end
    end
  end

class MinHeap
    def initialize
        @heap = []
    end

    def insert(node)
        @heap << node
        heapify_up
    end

    def extract_min
        return nil if empty?

        min = @heap[0]
        last = @heap.pop

        unless empty?
            @heap[0] = last
            heapify_down
        end

        min
    end

    def empty?
        @heap.empty?
    end

    private

    def heapify_up
        current_index = @heap.size - 1

        while current_index > 0
            parent_index = (current_index -1) / 2

            break if @heap[current_index][2] >= @heap[parent_index][2]
            current_index = parent_index
        end
    end

    def heapify_down
        current_index = 0
      
        while true  
          left_child_index = 2 * current_index + 1
          right_child_index = 2 * current_index + 2
          smallest = current_index    
      
          if left_child_index < @heap.size && @heap[left_child_index][2] < @heap[smallest][2]
            smallest = left_child_index
          end
          
          if right_child_index < @heap.size && @heap[right_child_index][2] < @heap[smallest][2]
            smallest = right_child_index
          end
      
          break if smallest == current_index
      
          @heap[current_index], @heap[smallest] = @heap[smallest], @heap[current_index]
          current_index = smallest
        end
    end
end

def get_algorithm_choice
    puts "Escolha o algoritmo para encontrar a Minimum Spanning Tree:"
    puts "1. Prim"
    puts "2. Kruskal"
    print "Digite o número correspondente ao algoritmo escolhido: "
    gets.chomp.to_i
end

algorithm_choice = get_algorithm_choice

g= Graph.new(4)
g.add_edge(0, 1, 10)
g.add_edge(0, 2, 6)
g.add_edge(0, 3, 5)
g.add_edge(1, 3, 15)
g.add_edge(2, 3, 4)

minimum_spanning_tree = 
    case algorithm_choice
    when 1
        g.prim
    when 2
        g.kruskal
    else
        puts "Opção inválida."
        exit 
    end

puts "Arestas na árvore mínima de abrangência:"
minimum_spanning_tree.each { |edge| puts "#{edge[0]} -- #{edge[1]} == #{edge[2]}"}