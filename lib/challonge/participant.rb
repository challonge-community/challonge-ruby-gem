# the only attributes that will save are: name, seed, challonge_username, email, misc

class Challonge::Participant < Challonge::API
  self.site = "https://challonge.com/api/tournaments/:tournament_id"

  def tournament
    Challonge::Tournament.find(self.prefix_options[:tournament_id])
  end

  def tournament=(tournament)
    self.prefix_options[:tournament_id] = tournament.id
  end

  def randomize!
    validated_post(:randomize)
  end

  protected

  def readonly_attributes
    %w/challonge_email_address_verified/
  end
end
