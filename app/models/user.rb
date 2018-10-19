class User 
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tickets
  has_many :reviews
  has_many :movie_interests
  #enum role: { admin: 0, customer: 1, critic: 2 }
  #enum active: { inactive: 0, uactive: 1}

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Customized
  field :name, type: String
  field :role, type: String, default: "customer"
  field :active, type: String, default: "uactive"

  index({ email: 1}, { unique: true})
  index({ reset_password_token: 1}, { unique: true})
 
  validates :name, presence: true, length: { minimum: 3, maximum: 40 }
  validates :encrypted_password, presence: true, confirmation: true
  validates :role, presence: true
  validates :active, presence: true
  validates :email, presence: true, length: { maximum: 255 }
  #after_create :user_registration_email

  def user_registration_email
    puts "\n\n\nhello\n\n\n\n"
    UserMailer.with(user: self).welcome_email.deliver_later
  end
end