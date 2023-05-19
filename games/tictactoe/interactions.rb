module Games
  module TicTacToe
    module Interactions
      include Validation

      def ask_spot(current, board, markers, error = false)

        unless error
          STDOUT.puts("Player #{current.position} : Please choose a number between 0 and 8:")
        end

        spot = STDIN.gets

        error_messages = {
          only_numbers_str: "Player #{current.position}: Only numbers are allowed",
          valid_choice: "Player #{current.position}: Spot already chosen. Try again.",
          valid_number: "Player #{current.position}: Spot should be a number between 0 and 8"
        }

        result = valid_spot(spot, board, markers)

        if result[:ok] === false
          STDOUT.puts(error_messages[result[:action]])
          ask_spot(current, board, markers, true)
        else
          result
        end
      end
    end
  end
end