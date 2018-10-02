# frozen_string_literal: true

class MovieInterest < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :movie_id, uniqueness: { scope: :user_id }

end
