# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :show
end
