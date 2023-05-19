module Games
  module TicTacToe
    class Start
      def self.call
        ::Interactions.welcome
        game = Game.new
        game.evaluate
      end
    end
  end
end