require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    
    @board = Board.new
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    debugger
    dup_board = @board.dup
    next_mover_mark = []
    


    (0..dup_board.length).each do |row|
      (0..dup_board[0].length).each do |col|

        position = [row, col]

        if dup_board.empty?(position)
          
          position = next_mover_mark

          prev_move_pos = position
          possible_moves << position

        end
      end
    end
    possible_moves
  end
end
