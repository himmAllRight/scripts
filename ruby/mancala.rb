## Class Defs
class Player
  def initialize(name, boardSize, initialMarbelCount, reverseP)
    @name      = name
    @board     = Array.new(boardSize, initialMarbelCount)
    @boardSize = boardSize
    @score     = 0
    @reverseP  = reverseP
  end

  # Accessor methods
  def name
    @name
  end

  def board
    @board
  end

  def score
    @score
  end

  def reverseP
    @reverseP
  end

  # Set Methods
  def set_score (score)
    @score = score
  end

  # Print Methods
  def board_string ()
    returnString = "|"
    if @reverseP
      @board.reverse.each do |x|
        returnString = returnString + x.to_s.center(5) + "|"
      end
      else
        @board.each do |x|
          returnString = returnString + x.to_s.center(5) + "|"
        end
    end
    return returnString
  end


  def board_labels ()
    if @reverseP
      ('a'..'z').to_a.take(@boardSize).reverse.map { |n| n.to_s.center(5)}.join(" ")

  else
    ('a'..'z').to_a.take(@boardSize).map { |n| n.to_s.center(5)}.join(" ")
    end
  end

end


## Function Defs
def createBoardIndex(boardSize)
  boardIndexHash = Hash.new
  boardIndex     = 0
  ('a'..'z').to_a.take(boardSize).each do |letter|
    boardIndexHash[letter] = boardIndex
    boardIndex += 1
  end
  return boardIndexHash
end


def printGameBoard(p1, p2, boardSize)
  border     = "-" * (((boardSize * 6) + 1) + 18)
  p1_row     = "|" + p1.score.to_s.center(8) + p1.board_string + (" " * 8) + "|"
  p2_row     = "|" + (" " * 8) + p2.board_string + p2.score.to_s.center(8) + "|"
  mid_row    = "|" + (" " * 8) + ("-" * ((boardSize * 6) + 1)) + (" " * 8) + "|"
  p1_labels  =  (" " * 10) + p1.board_labels + (" " * 9)
  p2_labels  =  (" " * 10) + p2.board_labels + (" " * 9)
   


  print(p1_labels, "\n", border, "\n", p1_row, "\n", mid_row, "\n", p2_row, "\n", border, "\n", p2_labels, "\n")
    
end


## Setup & Execution Code ##
########################################################
## Player Names
player1Name = "Ryan"
player2Name = "Rebecca"

## Initial Game Settings
boardSize          = 6
initialMarbelCount = 4


boardIndexHash = createBoardIndex(boardSize)
puts boardIndexHash["b"]

testStr = "Ryan" +
          " " +
          "Himmelwright"
