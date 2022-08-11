class TicTacToe
    attr_reader :board
     WIN_COMBINATIONS=[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]]
    
    def initialize
        @board = Array.new(9," ");
       
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]}\n #{@board[3]} | #{@board[4]} | #{@board[5]}\n #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def input_to_index str
        (str.to_i) -1
    end

    def move token="X", index
        @board[index] = token
    end

    def position_taken? index
        @board[index] == " "? false : true
    end

    def valid_move? position
        if (0 < position && position < 9) 
            return position_taken?(position)
        else
            return false
        end
    end

    def turn_count
        @board.count{|x| x!=" "}
    end

    def current_player
        self.turn_count.odd? ? "O" : "X"
    end

    def turn 
        puts "Enter Move: "
        gets position
        index = self.input_to_index(position)
        if self.valid_move?(index) 
            move(current_player, index)
        else
            puts "Invalid Move"
            turn
        end
        self.display_board
    end

    def won?
        WIN_COMBINATIONS.each{ |combo| 
        if position_taken?(combo[0]) && [@board[combo[0]], @board[combo[1]], @board[combo[2]]].uniq.length == 1
            return true
        else
            return false
        end
        }
    end

    def full?
        turn_count >= 9 ? true : false
    end

    def draw?
        if full?
            won? ? false : true
        else
            false
        end
    end

    def over?
        won? || full?
    end

    def winner
        current_player
    end

    def play
        
    end
end