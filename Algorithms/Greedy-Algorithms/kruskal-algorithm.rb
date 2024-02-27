class Graph
    def initialize(vertices_number)
      @vertices_number = vertices_number
      @edges = []
    end
  
    def add_edge(origin, destination, weight)
      @edges << [origin, destination, weight]
    end
  
    def find(father, element)
        root = element
        root = father[root] while father[root] != root
        return root
    end
          
    def union(father, classification, x, y)
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
          union(father, classification, set_origin, set_destination)
        end
      end
  
      minimum_cost = 0
      puts "Arestas na MST construída"
      result.each do |origin, destination, weight|
        minimum_cost += weight
        puts "#{origin} -- #{destination} == #{weight}"
      end
      puts "Árvore Geradora Mínima, Custo Mínimo: #{minimum_cost}"
    end            
  end
  
  if __FILE__ == $PROGRAM_NAME
    graph = Graph.new(4)
    graph.add_edge(0, 1, 10)
    graph.add_edge(0, 2, 6)
    graph.add_edge(0, 3, 5)
    graph.add_edge(1, 3, 15)
    graph.add_edge(2, 3, 4)
  
    graph.kruskal_mst
  end
  