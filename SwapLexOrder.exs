import Map
import List

defmodule SwapLexOrder  do
  
  def swapLexOrder str, pairs do
    # put each pair of pairs into a hash forwards and backwards O(n)
    pairs = toMap(pairs)
    # put str into a tuple for fast access O(n)
    indexed = String.to_charlist(str)
    |> List.to_tuple()
    # for every character in str
    # look for highest character in str according to map

  end
  
  def toMap pairs, graph \\ %{} do
    IO.inspect(graph)
	if pairs == [] do
	  graph
    else
      pair = hd(pairs)
      toMap(tl(pairs),
        put(graph, hd(pair), [hd(tl(pair)) | graph[hd(pair)]])
        |> put(hd(tl(pair)), [hd(pair) | graph[hd(tl(pair))]]))
    end
  end

  def toLists graph, keyList \\ keys(graph), lists \\ [[]] do
	if keyList == [] do
	  lists
    else
          
      
    end
  end

  def followValue graph, value, visited \\ %{}, list \\ [nil] do
	if graph[value] == nil or visited[graph[value]] do
	  list
    else
      values = graph[value]
      for  v <- values do
        followValue(graph, v, put(visited, value, true), [value|list])
      end
      |> flatten()
    end
  end
  
end

SwapLexOrder.toMap([[1, 4], [3, 4]])
