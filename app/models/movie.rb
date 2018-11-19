class Movie
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :name, type: String
  field :summary, type: String
  field :status, type: String
  field :image, type: String
  mount_uploader :image, ImageUploader

  #Database associations
  has_and_belongs_to_many :theatres
  has_many :shows
  has_many :reviews
  has_many :movie_interests

  #Validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :summary, presence: true, length: { maximum: 140 }
  validates :status, presence: true

  #Callbacks
  after_destroy :delete_movie_interests

  private

  #Methods
  def delete_movie_interests
    @subscriptions = MovieInterest.where(movie_id: id)
    @subscriptions.each(&:destroy)
  end
end
