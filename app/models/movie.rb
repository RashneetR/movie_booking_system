# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :shows
  has_and_belongs_to_many :theatres, join_table: 'movie_theatres'
  has_many :reviews
  has_many :movie_interests
  has_many :users, through: :movie_interests
  enum status: { now_showing: 0, future_release: 1 }
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :summary, presence: true, length: { maximum: 140 }
  validates :status, presence: true
end
