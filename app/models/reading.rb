class Reading < ApplicationRecord
  belongs_to :user

  has_many :reading_cards
  has_many :cards, through: :reading_cards
end
