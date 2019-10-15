import List
import Map

defmodule PossibleSums do
  
  def possibleSums coins, quants do
    length =
      allMultiples(coins, quants)
      |> powersum()
      |> keys()
      |> length()
    length - 1
  end
  
  def powersum amounts, sums \\ %{0 => true} do
    if amounts == [] do
      sums
    else
        powersum(tl(amounts),
          foldl(keys(sums),sums,
            fn(sum, sums) ->
              foldl(hd(amounts), sums,
                fn(coinMult, sums) ->
                  put(sums, sum + coinMult, true)
                end)
            end))
    end
  end

  def allMultiples coins, quants, mults \\ [] do
	if coins == [] do
	  mults
    else
      allMultiples(tl(coins), tl(quants), [multiples(hd(coins), hd(quants)) | mults])
    end
  end
  
  def multiples coin, quant, mults \\ [] do
	if quant == 0 do
	  mults
    else
      multiples(coin, quant - 1, [coin * quant | mults])
    end
  end
  
end

PossibleSums.possibleSums([10, 50, 100, 500], [5, 3, 2, 2])
|>IO.inspect()
