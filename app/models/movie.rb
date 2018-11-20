require 'file_size_validator' 
class Movie
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :name, type: String
  field :summary, type: String
  field :status, type: String, default: 'Future Release'
  mount_uploader :image, ImageUploader

  #Database associations
  has_and_belongs_to_many :theatres
  has_many :shows
  has_many :reviews
  has_many :movie_interests, dependent: :destroy

  #Validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :summary, presence: true, length: { maximum: 140 }
  validates :status, presence: true
  validates :image, presence: true, file_size: { less_than_or_equal_to: 15.megabytes.to_i }
end
