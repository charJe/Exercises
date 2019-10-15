defmodule Zip do
  def zip lst1, lst2, fun \\ fn(x, y) -> [x, y]  end do
	zip(lst1, lst2, fun, [])
    |> Enum.reverse()
  end

  defp zip lst1, lst2, fun, acc do
	if lst1 == [] or lst2 == [] do
      acc
    else
      zip(tl(lst1), tl(lst2), fun,
        [fun.(hd(lst1), hd(lst2)) | acc])
    end
  end
end
Zip.zip([1, 2, 3, 4], [5, 6, 7, 8], &+/2)
|> IO.inspect()
nnnnn
