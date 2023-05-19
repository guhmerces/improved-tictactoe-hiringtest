module Games
  module TicTacToe
    module Board
      def get_available_spaces
        available = []
        @board.each do |spot|
          if (@markers.include? spot) === false
            available.push(spot)
          end
        end
        available
      end
      def get_random_move
        available_spaces = get_available_spaces
        n = rand(0..(available_spaces.count - 1))
        available_spaces[n].to_i
      end
      def get_best_move
        best_spot = nil

        if is_space_available(4)
          best_spot = 4
        end

        get_available_spaces.each do |spot|
          spot = spot.to_i
          next_player = get_next_player
          if game_over_if_player_chooses(@current, spot)
            best_spot = spot
          end
          if !best_spot && game_over_if_player_chooses(next_player, spot)
            best_spot = spot
          end
        end
        best_spot ? best_spot : get_random_move
      end
      def game_over_if_player_chooses(player_info, spot)
        temp_board = @board.dup
        temp_board[spot] = player_info.marker
        check_game_is_over(temp_board)
      end
      def is_space_available(spot)
        !@markers.include? @board[spot]
      end
      def check_tie(board)
        board.all? { |spot| spot == "X" || spot == "O" }
      end
      def check_game_is_over(board)
        [board[0], board[1], board[2]].uniq.length == 1 || # 1
          [board[3], board[4], board[5]].uniq.length == 1 || # 1
          [board[6], board[7], board[8]].uniq.length == 1 || # 1
          [board[0], board[3], board[6]].uniq.length == 1 || # 3
          [board[1], board[4], board[7]].uniq.length == 1 || # 3
          [board[2], board[5], board[8]].uniq.length == 1 || # 3
          [board[0], board[4], board[8]].uniq.length == 1 || # 4
          [board[2], board[4], board[6]].uniq.length == 1    # 2
      end
    end
  end
end