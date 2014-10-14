class Challonge
  class API < ::ActiveResource::Base
    self.user = 'your_challonge_username'
    self.password = 'your_challonge_api_key'
    self.format = :json
    self.include_root_in_json = true

    @readonly_attributes = []

    def self.username=(uname)
      self.user = uname
    end

    def self.username
      self.user
    end

    def self.key=(key)
      self.password = key
    end

    def self.key
      self.password
    end

    protected

    def validated_post(action)
      post(action)
      true
    rescue ::ActiveResource::ResourceInvalid => error
      errors.from_xml(error.response.body)
      false
    end

    def self.validated_post(action, options, data)
      self.post(action, options, data)
      true
    rescue ::ActiveResource::ResourceInvalid => error
      errors.from_xml(error.response.body)
      false
    end

    def encode
      {self.class.element_name => writable_attribute_hash}.to_json
    end

    def readonly_attributes
      []
    end

    def writable_attribute_hash
      attr_h = {}
      (attributes.keys - readonly_attributes).each do |key|
        attr_h[key] = attributes[key]
      end
      attr_h
    end
  end
end
