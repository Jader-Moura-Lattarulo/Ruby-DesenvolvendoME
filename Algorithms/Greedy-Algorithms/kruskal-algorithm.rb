class Graph
    def initialize
      @cities = {}
      @edges = []
    end

    def add_city(name)
        @cities[name] = @cities.length
    end
  
    def add_edge(origin, destination, distance)
      @edges << [@cities[origin], @cities[destination], distance]
    end
  
    def find(parent, element)
        root = element
        root = parent[root] while parent[root] != root
        return root
    end
          
    def union(parent, rank, x, y)
      if rank[x] < rank[y]
        parent[x] = y
      elsif rank[x] > rank[y]
        parent[y] = x
      else
        parent[y] = x
        rank[x] += 1
      end
    end
  
    def kruskal_mst
      result = []
      index_edge = 0
      index_result = 0
  
      @edges = @edges.sort_by { |edge| edge[2] }
  
      parent = []
      rank = []
  
      (0...@cities.length).each do |vertex|
        parent << vertex
        rank << 0
      end
  
      while index_result < @cities.length - 1
        origin, destination, distance = @edges[index_edge]
        index_edge += 1
        set_origin = find(parent, origin)
        set_destination = find(parent, destination)
  
        if set_origin != set_destination
          index_result += 1
          result << [origin, destination, distance]
          union(parent, rank, set_origin, set_destination)
        end
      end
  
      minimum_cost = 0
      puts "Arestas na MST construída"
      result.each do |origin, destination, distance|
        minimum_cost += distance
        puts "#{city_by_index(origin)} -- #{city_by_index(destination)} == #{distance} km"
      end
      puts "Árvore Geradora Mínima, Custo Mínimo: #{minimum_cost}"
    end
    
    private

    def city_by_index(index)
        @cities.key(index)
    end
  end

  def get_city_data
    print "Digite o nome da cidade: "
    name = gets.chomp
    name
  end 

  def get_edge_data(cities)
    print "Digite a cidade de origem: "
    origin = gets.chomp
    print "Digite a cidade de destino: "
    destination = gets.chomp
    print "Qual é a distância em km entre #{origin} e #{destination}: "
    distance = gets.to_i

    [origin, destination, distance]
  end 

  if __FILE__ == $PROGRAM_NAME
    graph = Graph.new

    number_cities = 4
    number_cities.times do
        city = get_city_data
        graph.add_city(city)
    end
    
    num_edges = number_cities -1
    num_edges.times do
        origin, destination, distance = get_edge_data(graph.cities)
        graph.add_edge(origin, destination, distance)
    end
  
    graph.kruskal_mst
  end
  