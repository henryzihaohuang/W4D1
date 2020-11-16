require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def losing_node?(evaluator)
    return true if board.over? && 
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    # debugger
    dup_board = @board.dup
    possible_moves = []
    

    # debugger
    (0...dup_board.rows.length).each do |row|
      (0...dup_board.rows.length).each do |col|
        position = [row, col]
        # debugger
        if dup_board.empty?(position)
          # debugger
          dup_board[position] = next_mover_mark

          if next_mover_mark == :o
            next_mover_mark = :x
          else
            next_mover_mark = :o
          end

          possible_moves << TicTacToeNode.new(dup_board,next_mover_mark,position)

        end
      end
    end
    possible_moves
  end


end
