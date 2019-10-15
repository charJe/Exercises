import IO
import Enum
import List
require IEx
import IEx
pry()

defmodule Sudoku2 do

  def sudoku2(grid) do
    # rows
    checkRows(grid) and
    # columns
    checkRows(transpose(grid)) and
    # squares
    checkSquares(grid)
  end

  def checkSquares(grid) do
    for rows <- 0..(div((length(grid)-1), 3)) do
      r = 3*rows
      for columns <- 0..(div((length(grid)-1), 3)) do
        c = 3*columns
	    getSquare(grid, r, c)
        |> checkSet()
      end 
    end
    |> flatten()
    |> foldl(true, fn x, acc -> x and acc end)
  end

  def getSquare(grid, sr, sc) do
    for r <- sr..(sr+2) do
	  for c <- sc..(sc+2) do
	    at(at(grid, r), c)
      end
    end
  end

  def checkSet(box) do
    # remove dots
    box = flatten(box)
    box = reject(box, fn x -> x == "." end)
    box == uniq(box)
  end
  
  def transpose(grid)  do
    for r <- 0..(length(grid) -1)  do
	  for c <-  0..(length(grid) -1) do
        at(at(grid, c), r)
      end
    end
  end
  
  def checkRows(grid) do
    if length(grid) == 0 do
	  true
    else
      checkSet(hd(grid)) and
      checkRows(tl(grid))
    end
  end
  
end

puts(Sudoku2.sudoku2([[".",".",".","1","4",".",".","2","."], 
                      [".",".","6",".",".",".",".",".","."], 
                      [".",".",".",".",".",".",".",".","."], 
                      [".",".","1",".",".",".",".",".","."], 
                      [".","6","7",".",".",".",".",".","9"], 
                      [".",".",".",".",".",".","8","1","."], 
                      [".","3",".",".",".",".",".",".","6"], 
                      [".",".",".",".",".","7",".",".","."], 
                      [".",".",".","5",".",".",".","7","."]]))
