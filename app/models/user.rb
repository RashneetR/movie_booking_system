# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tickets
  has_many :reviews
  has_many :movie_interests
  has_many :movies, through: :movie_interests
  enum role: { admin: 0, customer: 1, critic: 2 }
end
