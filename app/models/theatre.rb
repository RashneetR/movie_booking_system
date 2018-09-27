# frozen_string_literal: true

class Theatre < ApplicationRecord
  has_and_belongs_to_many :movies, join_table: 'movie_theatres'

  has_many :shows
end
