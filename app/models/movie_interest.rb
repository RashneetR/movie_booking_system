class MovieInterest
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :movie
  belongs_to :user

  index({ user_id: 1 }, unique: true)
  index({ movie_id: 1 }, unique: true)
  index({ user_id: 1, movie_id: 1 }, unique: true)

  validates :movie_id, uniqueness: { scope: :user_id }
end