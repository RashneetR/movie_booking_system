# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre
  has_many :tickets
end
