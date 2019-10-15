import IO
import Enum
import Integer

defmodule Decipher do
  
  def decipher(cipher) do
    String.codepoints(cipher)
    # delimit characters
    |> delimit()
    # convert strings to numbers and combine
    |> map_join(fn c -> <<parse(c) |> elem(0)>> end) 
  end

  def delimit(cipher) do
	if(cipher == []) do
      []
    else
      if(hd(cipher) == "1") do
        [hd(cipher) <> hd(tl(cipher)) <> hd(tl(tl(cipher))) | delimit(tl(tl(tl(cipher))))]
      else
        [hd(cipher) <> hd(tl(cipher)) | delimit(tl(tl(cipher)))]
      end
    end
  end

end

IO.inspect(Decipher.decipher("10511632119111114107115"))
