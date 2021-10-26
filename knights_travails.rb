MOVES = [[-2, 1], [-1, 2], [1, 2], [2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]

class Node
  attr_accessor :position, :parent

  def initialize
    @position = nil
    @parent = nil
  end
end

def valid_position?(pos)
  pos.each { |idx| return false if idx.negative? || idx > 7 }
  true
end

def build_tree(start, finish)
  queue = [start]
  board = Array.new(8) { Array.new(8) { Node.new } }
  board[start[0]][start[1]].position = start

  until queue.empty?
    current_pos = queue.shift
    break if current_pos == finish

    (0...8).each do |idx|
      next_move = [current_pos[0] + MOVES[idx][0], current_pos[1] + MOVES[idx][1]]
      if valid_position?(next_move) && !board[next_move[0]][next_move[1]].position
        board[next_move[0]][next_move[1]].position = next_move
        board[next_move[0]][next_move[1]].parent = board[current_pos[0]][current_pos[1]]
        queue << next_move
      end
    end
  end
  board
end

