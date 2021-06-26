class Invoice
  include Mongoid::Document
  field :body, type: Hash
end
