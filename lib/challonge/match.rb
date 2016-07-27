# the only attributes that will save are: scores_csv, winner_id

class Challonge::Match < Challonge::API
  self.site = "https://api.challonge.com/api/tournaments/:tournament_id"

  def tournament
    Challonge::Tournament.find(self.prefix_options[:tournament_id])
  end

  def tournament=(tournament)
    self.prefix_options[:tournament_id] = tournament.id
  end

  def player1
    _find_player(:player1_id)
  end

  def player2
    _find_player(:player2_id)
  end

  def player_winner? (participant)
    (participant.id != self.winner_id)
  end

  # not implemented by API
  def create; end

  # not implemented by API
  def destroy; end

  protected

  def readonly_attributes
    %w/prerequisite_match_ids_csv/
  end

  private
  def _find_player(player)
    if self.attributes[player] != nil
      Challonge::Participant.find(self.attributes[player], :params => {:tournament_id => self.prefix_options[:tournament_id]})
    else
      Challonge::Participant.new({:name => 'TBD'})
    end
  end
end
