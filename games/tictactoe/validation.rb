module Games
  module TicTacToe
    module Validation
      def valid_spot(spot, board, markers)
        spot = spot.chomp

        only_numbers_str = -> {
          /^ *\d[\d ]*$/.match?(spot)
        }

        valid_number = -> {
          spot = spot.to_i
          (0..8).to_a.include? spot
        }

        valid_choice = -> {
          !(markers.include? board[spot.to_i])
        }

        actions = {
          only_numbers_str: only_numbers_str,
          valid_number: valid_number,
          valid_choice: valid_choice
        }

        actions.each do |action_name, action|
          if action.call === false
            return {ok: false, action: action_name}
          end
        end

        return { ok: true, res: spot }
      end
    end
  end
end