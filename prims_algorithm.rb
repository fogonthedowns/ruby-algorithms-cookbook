class Graph
  attr_accessor :vertices, :covered_nodes
  def initialize()
    @vertices = {}
    @covered_nodes = []
  end

  # symbol, hash
  # hash = {:vertex_name => distance}
  def add_vertex(name, edges)
    @vertices[name] = edges
  end

  def nodes
    @vertices.keys
  end
end


class Prim
  attr_accessor :covered_nodes, :edges
  def initialize	  
    @edges = [:A]
    @covered_nodes = [:A]
    @graph = Graph.new
    @graph.add_vertex(:A, {:B => 7, :C => 8})
    @graph.add_vertex(:B, {:A => 7, :F => 2})
    @graph.add_vertex(:C, {:A => 8, :F => 6, :G => 4})
    @graph.add_vertex(:D, {:F => 8})
    @graph.add_vertex(:E, {:H => 1})
    @graph.add_vertex(:F, {:B => 2, :C => 6, :D => 8, :G => 9, :H => 3})
    @graph.add_vertex(:G, {:C => 4, :F => 9})
    @graph.add_vertex(:H, {:E => 1, :F => 3})
  end
    
  def calculate
    while !nodes_left_to_visit.empty?
      @covered_nodes.each do |key|
        array_of_node_connections_sorted_by_length = @graph.vertices[key].sort_by{|v|v.last}
        array_of_node_connections_sorted_by_length.each do |connection|
          break if nodes_left_to_visit.empty?
          recursive_find_near_function(connection)
        end
      end
    end
  end

  def recursive_find_near_function(connection)

    return if nodes_left_to_visit.empty?

    # cover the node
    return if @covered_nodes.find_index(connection[0]) != nil
    @covered_nodes << connection[0]
    puts "path:#{@covered_nodes}"

    # find its connections
    connection_linked_to_others = @graph.vertices[connection[0]]

    # sorted those connections
    sorted_connection_list = connection_linked_to_others.sort_by{|v|v.last}

    # group into hash to delete covered_nodes keys
    grouped_hash = sorted_connection_list.group_by(&:first)
    @covered_nodes.each{|node|grouped_hash.delete(node)}
    selected_connection = grouped_hash.values.sort_by{|v|v.last}.last

    if !nodes_left_to_visit.empty? && !selected_connection.nil?
      recursive_find_near_function(selected_connection.first)
    end
  end

  def nodes_left_to_visit
    @graph.nodes - @covered_nodes
  end

end


prim = Prim.new
prim.calculate
