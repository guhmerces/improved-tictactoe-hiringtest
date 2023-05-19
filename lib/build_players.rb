module BuildPlayers
  def build_players(players_qty, interactions)
    players = []
    players_qty.times do |i|
      player = Player.new
      player.id = i + 1

      interactions.each do |interaction|
        case interaction
        when :is_human
          player.is_human = Interactions.ask_is_human?(player.id)
        when :name
          player.name = Interactions.define_name(player)
        when :is_ready
          player.is_ready = Interactions.ask_is_ready?(player.name)
        end
      end
      players.push(player)
    end
    players
  end
end
