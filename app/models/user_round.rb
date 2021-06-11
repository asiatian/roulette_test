class UserRound < ApplicationRecord
  belongs_to :user
  belongs_to :round

  enum color: [:green, :red, :black]

  def outcome
     if round.color == color
       self.green? ? "#{self.amount*15}" : "#{self.amount*2}"
     else
       "-#{amount}"
     end
  end
end
