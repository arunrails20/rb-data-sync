class Inward
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: Hash
end
