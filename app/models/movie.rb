class Movie
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :shows
  has_and_belongs_to_many :theatres
  has_many :reviews
  has_many :movie_interests
  after_destroy :delete_movie_interests

  field :name, type: String
  field :summary, type: String
  field :status, type: String
  field :image, type: String

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :summary, presence: true, length: { maximum: 140 }
  validates :status, presence: true
  mount_uploader :image, ImageUploader

  private

  def delete_movie_interests
    @subscriptions = MovieInterest.where(movie_id: id)
    @subscriptions.each(&:destroy)
  end
end