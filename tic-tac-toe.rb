class Players
  attr_accessor :name, :turn, :sign

  def initialize(name, turn, sign)
    @name = name
    @turn = turn
    @sign = sign
  end

  def switch_turn
    self.turn = !self.turn
  end
end

class Game
  attr_accessor :player1, :player2, :grid, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @winner = nil
    @grid = Array.new(10)
  end

  def win_condition
    lines = [1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]
    result = false
    # returns true if any player wins
    lines.each do |line|
      if grid[line[0]] == grid[line[1]] && grid[line[1]] == grid[line[2]] && grid[line[0]] != nil
        result = true
        self.winner = !player1.turn ? player1.name : player2.name
        break
      end
    end
    # returns true if no squares are left to be marked
    if grid.join.size == 9
      result = true
    end
    # otherwise returns false
    result
  end

  def display_grid
    puts "\n"
    puts "1 | 2 | 3" + "     #{grid[1]||" "} | #{grid[2]||" "} | #{grid[3]||" "}"
    puts "--+---+--" + "     --+---+--"
    puts "4 | 5 | 6" + " =>  #{grid[4]||" "} | #{grid[5]||" "} | #{grid[6]||" "}"
    puts "--+---+--" + "     --+---+--"
    puts "7 | 8 | 9" + "     #{grid[7]||" "} | #{grid[8]||" "} | #{grid[9]||" "}"
  end

  def play_game
    display_grid

    until win_condition
      # gets player name based on the turn
      player_name = player1.turn ? player1.name : player2.name
      puts "\n#{player_name} where do you want to mark :"
      # player input
      box_num = gets.chomp.to_i

      if !(box_num in (1..9))
        puts "\nEnter a valid square num"
        next
      end
      if grid[box_num] != nil
        puts "\nThat box is already marked"
        next
      end

      self.grid[box_num] = player1.turn ? player1.sign : player2.sign
      player1.switch_turn
      player2.switch_turn

      display_grid
    end

    if winner
      puts "\n#{winner} wins! Congratulations!"
    else
      puts "\nIt's a draw! Neither player wins."
    end
  end
end

john = Players.new("john", true, "x")
max = Players.new("max", false, "o")

game1 = Game.new(john, max)
game1.play_game
