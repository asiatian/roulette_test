class Round < ApplicationRecord
  has_many :user_rounds

  enum color: [:green, :red, :black]
end
