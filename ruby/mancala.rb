## Class Defs
class Player
  # accessors
  attr_reader   :name
  attr_accessor :board
  attr_accessor :score
  attr_reader   :reverseP
  
  def initialize(name, boardSize, initialMarbelCount, reverseP)
    @name      = name
    @board     = Array.new(boardSize, initialMarbelCount)
    @boardSize = boardSize
    @score     = 0
    @reverseP  = reverseP
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
  left_buffer = (" " * (p1.name.length + 1))
  border      = left_buffer + "-" * (((boardSize * 6) + 1) + 18)
  p1_row      = p1.name + " |" + p1.score.to_s.center(8) + p1.board_string + (" " * 8) + "|"
  p2_row      = left_buffer + "|" + (" " * 8) + p2.board_string + p2.score.to_s.center(8) + "|" + " " + p2.name
  mid_row     = left_buffer + "|" + (" " * 8) + ("-" * ((boardSize * 6) + 1)) + (" " * 8) + "|"
  p1_labels   =  left_buffer + (" " * 10) + p1.board_labels + (" " * 9)
  p2_labels   =  left_buffer + (" " * 10) + p2.board_labels + (" " * 9)
  
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


# Test run
p1 = Player.new("Ryan", 6, 4, true)
p2 = Player.new("Rebecca", 6, 4, false)

p1.board[1] = 7
p2.board[1] = 6

puts "This is just a test printout of an example board."
puts "Going to add the game logic next :)\n\n"
printGameBoard(p1, p2, 6)
