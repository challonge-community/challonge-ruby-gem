# the only attributes that will save are: scores_csv, winner_id

class Challonge::Match < Challonge::API
  self.site = "https://challonge.com/api/tournaments/:tournament_id"

  def tournament
    Challonge::Tournament.find(self.prefix_options[:tournament_id])
  end

  def tournament=(tournament)
    self.prefix_options[:tournament_id] = tournament.id
  end

  # not implemented by API
  def create; end

  # not implemented by API
  def destroy; end

  protected

  def readonly_attributes
    %w/prerequisite_match_ids_csv/
  end
end
