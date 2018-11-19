class Theatre
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :name, type: String

  #Database associations
  has_and_belongs_to_many :movies
  embeds_one :address
  accepts_nested_attributes_for :address
  has_many :shows  

  #Validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
end
