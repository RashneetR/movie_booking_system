class Address
  include Mongoid::Document
  #Fields
  field :address, type: String

  #Database Association
  embedded_in :theatre

  #Validation
  validates :address, length: { maximum: 255 }
end
