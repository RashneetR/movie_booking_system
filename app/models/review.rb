class Review
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :rating, type: Integer
  field :comment, type: String

  #Indexes
  index({ user_id: 1, movie_id: 1 }, unique: true)

  #Database associations
  belongs_to :user
  belongs_to :movie

  #Validations
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :movie_id, presence: true
end