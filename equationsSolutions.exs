import List
defmodule EquationsSolutions do

  def equationSolutions left, right do
    for a <- left..right do
      findPossible(self(), left, right, a, left)
    end
    foldl(for a <- left..right do a end, 0,
      fn(_, acc)->
        receive do
          msg ->
            acc + msg
        end
      end)
  end
  
  def findPossible parent, left, right, a, b, acc \\ 0 do
	if b > right do
	  send(parent, acc)
    else
      findPossible(parent, left, right, a, b+1, acc +
      if :math.pow(a, 3) == :math.pow(b, 2) do
        1
      else
        0
      end)
    end
  end
end

EquationsSolutions.equationSolutions(1, 8)
|> IO.inspect()
