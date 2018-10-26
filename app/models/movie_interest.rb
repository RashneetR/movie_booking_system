class MovieInterest
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :movie, foreign_key: :movie_id
  belongs_to :user, foreign_key: :user_id

  index({ user_id: 1 }, unique: true)
  index({ user_id: 1 }, unique: true)
  index({ user_id: 1, movie_id: 1 }, unique: true)

  validates :movie_id, uniqueness: { scope: :user_id }
end