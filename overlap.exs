defmodule OverlapList do

  def overlaps intervals, track \\ %{}, count \\ 0 do
    if intervals == [] do
	  count
    else
        {overlap, newTrack} = addInterval(hd(hd(intervals)),
          hd(tl(hd(intervals))), track, false)
        overlaps(tl(intervals), newTrack, count + if(overlap) do  1 else 0 end)
    end
  end

  defp addInterval start, fin, track , overlap do
    if(start > fin) do
	  {overlap, track}
    else
      addInterval(start + 1, fin, Map.put(track, start, true),
        overlap or if Map.get(track, start) do true else false end)
    end
  end
  
end
IO.inspect(OverlapList.overlaps([[1,4],[2,9],[7,8],[8,10],[10,11]]))
