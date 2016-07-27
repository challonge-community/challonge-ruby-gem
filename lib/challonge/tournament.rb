class Challonge::Tournament < Challonge::API
  self.site = "https://api.challonge.com/api"

  def description
    if self.attributes.include?('description_source')
      self.description_source
    end
  end

  def description=(val)
    self.description_source = val
  end

  def start!
    validated_post(:start)
  end

  def finalize!
    validated_post(:finalize)
  end

  def reset!
    validated_post(:reset)
  end

  def participants(scope = :all)
    Challonge::Participant.find(scope, :params => {:tournament_id => self.id})
  end

  def matches(scope = :all)
    Challonge::Match.find(scope, :params => {:tournament_id => self.id})
  end

  protected

  def readonly_attributes
    %w/description_source subdomain full_challonge_url live_image_url sign_up_url/
  end

  def writable_attribute_hash
    attr_h = super
    attr_h['description'] = description
    attr_h
  end
end
