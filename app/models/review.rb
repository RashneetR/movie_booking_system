# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :rating, presence: true, inclusion: { in: 1...5 }
  validates :comment, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :movie_id, presence: true
end
