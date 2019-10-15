defmodule LaunchSequenceChecker do

  def launchSequenceChecker systemNames, stepNumbers, track \\ %{} do
	cond do
      systemNames == [] ->
	    true
      hd(stepNumbers) <= track[hd(systemNames)] and track[hd(systemNames)] != nil ->
        false
	  true ->
        launchSequenceChecker(tl(systemNames), tl(stepNumbers),
        Map.put(track, hd(systemNames), hd(stepNumbers)))
    end
  end
  
end

LaunchSequenceChecker.launchSequenceChecker(["stage_1", 
 "stage_2", 
 "dragon", 
 "stage_1", 
 "stage_2", 
 "dragon"],[1, 10, 11, 2, 12, 111])
|> IO.inspect()
