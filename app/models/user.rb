class User < ApplicationRecord
  has_many :user_rounds

  def to_s
    "#{name} #{lastname}"
  end

  def self.new_day
    self.all.each do |u|
      u.balance += 10000
      u.save
    end
  end
end
