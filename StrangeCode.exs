defmodule StrnageCode do
  def strangeCode s, e, msg \\ "", a \\ true do
	if s >= (e-1) do
	  msg
    else
      strangeCode(s + 1, e - 1,
        msg <>
        if a do
	      "a"
        else
          "b"
        end
        !a)
    end
  end
end

StrnageCode.strangeCode(4, 8)
|> IO.inspect()
