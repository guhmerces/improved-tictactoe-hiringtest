module Games
  module TicTacToe
    class Game
      include BuildPlayers
      include Interactions
      include ::Interactions
      include Board

      PlayerInfo = Struct.new(:position, :player, :marker)

      attr_accessor :players, :difficulty_level

      def initialize
        @players = build_players(2, [:is_human, :name])
        @game_is_over = false
        @current = PlayerInfo.new(1, players[0], "X")
        @board = %w[0 1 2 3 4 5 6 7 8]
        @markers = %w[X O]
      end

      def print_board
        puts"\n\n"
        puts "Board: \n"
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
        puts"\n"
      end

      def get_player_spot
        ask_spot(@current, @board, @markers)
      end

      def get_computer_spot
        case @difficulty_level
        when "easy"
          return { ok: true, res: get_random_move }
        when "hard"
          { ok: true, res: get_best_move }
        end
      end

      def update_board(spot)
        @board[spot] = @current.marker
      end

      def current_player
        @current
      end

      def get_next_player
        case @current.position
        when 1
          player = PlayerInfo.new(2, @players[1], @markers[1])
        when 2
          player = PlayerInfo.new(1, @players[0], @markers[0])
        end
        player
      end

      def set_next_player
        @current = get_next_player
      end

      def build_difficulty_level
        if @difficulty_level
          return
        end
        is_computer_a_player = @players.find do |player|
          player.is_human === false
        end
        if is_computer_a_player
          @difficulty_level = ::Interactions.ask_difficulty_level
        end
      end

      def evaluate
        build_difficulty_level

        until @game_is_over
          print_board

          if @current.player.is_human
            res = get_player_spot[:res]
          else
            res = get_computer_spot[:res]
          end

          update_board(res)

          if check_game_is_over(@board)
            print_board
            ::Interactions.game_over(@current.player)
            exit
          end

          if check_tie(@board)
            print_board
            ::Interactions.draw
            exit
          end

          set_next_player

          evaluate
        end
      end
    end
  end
end