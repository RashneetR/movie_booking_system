# frozen_string_literal: true

class MovieInterest < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
