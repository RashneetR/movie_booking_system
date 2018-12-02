class Theatre
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :name, type: String

  #Database associations
  has_and_belongs_to_many :movies
  has_many :shows
  embeds_one :address  

  #Validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  #Nested attributes
  accepts_nested_attributes_for :address
end
