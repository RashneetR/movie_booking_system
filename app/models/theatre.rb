# frozen_string_literal: true

class Theatre < ApplicationRecord
  has_many :shows
  has_and_belongs_to_many :movies, join_table: 'movie_theatres'
  validates :name, presence: true, length: { maximum: 50 }
end
