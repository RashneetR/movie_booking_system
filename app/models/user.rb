class User
  include Mongoid::Document
  include Mongoid::Timestamps
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable
  has_many :tickets
  has_many :reviews
  has_many :movie_interests

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Customized
  field :name, type: String
  field :role, type: String, default: 'customer'
  field :active, type: String, default: 'active'

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  field :locked_at,       type: Time

  index({ email: 1 }, unique: true)
  index({ reset_password_token: 1 }, unique: true)
  index({ confirmation_token: 1 }, unique: true)
  index({ unlock_token: 1 }, unique: true)

  validates :name, presence: true, length: { minimum: 3, maximum: 40 }
  validates :encrypted_password, presence: true, confirmation: true
  validates :role, presence: true
  validates :active, presence: true
  validates :email, presence: true, length: { maximum: 255 }
  after_create :user_registration_email

  def user_registration_email
    UserMailer.welcome_email(id.to_s).deliver_later
  end

  def active_for_authentication?
    super && active == 'active'
  end

  def inactive_message
    if active == 'inactive'
      'Sorry, this account has been deactivated. Sign up and activate account'
    else
      'Confirmation mail sent'
    end
  end

  protected

  def will_save_change_to_email?
    false
  end
end
