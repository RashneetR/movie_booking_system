class Review
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user, foreign_key: :user_id
  belongs_to :movie, foreign_key: :movie_id

  field :rating, type: Integer
  field :comment, type: String

  index({ user_id: 1, movie_id: 1 }, unique: true)

  validates :rating, presence: true, inclusion: { in: 1...5 }
  validates :comment, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :movie_id, presence: true
end