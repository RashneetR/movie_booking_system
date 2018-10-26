class Address
  include Mongoid::Document
  embedded_in :theatre

  field :address, type: String

  validates :address, length: { maximum: 255 }
end