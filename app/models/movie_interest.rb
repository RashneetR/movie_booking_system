# frozen_string_literal: true

class MovieInterest < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :movie_id, presence: true
  validates :user_id, presence: true
end
