class Theatre
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :shows
  has_and_belongs_to_many :movies
  embeds_one :address
  accepts_nested_attributes_for :address

  field :name, type: String

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
end