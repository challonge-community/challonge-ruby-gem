# the only attributes that will save are: name, seed, challonge_username, email, misc

class Challonge::Participant < Challonge::API
  self.site = "https://api.challonge.com/api/tournaments/:tournament_id"

  def initialize(attributes = {}, persisted = false)
    @attributes     = {}
    @prefix_options = {}
    @persisted = persisted

    # allow new and create to be passed a tournament or tournament_id
    real_attributes = attributes.slice!(:tournament, :tournament_id, "tournament", "tournament_id")
    load(real_attributes)
    attributes.each_pair do |attr, val|
      self.send("#{attr}=", val)
    end
  end

  def tournament
    Challonge::Tournament.find(self.prefix_options[:tournament_id])
  end

  def tournament=(tournament)
    self.prefix_options[:tournament_id] = tournament.id
  end

  def randomize!
    validated_post(:randomize)
  end

  def name
    super ? super : @attributes["challonge_username"]
  end

  protected

  def readonly_attributes
    %w/challonge_email_address_verified/
  end
end
