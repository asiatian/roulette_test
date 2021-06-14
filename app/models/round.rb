class Round < ApplicationRecord
  has_many :user_rounds

  enum color: [:green, :red, :black]

  def self.start_game
    bet_range = Weather.bet_range
    selector  = WalkerMethod.new(Round.colors.values, [2,49,49])
    round     = self.create()
    round.save

    User.where("balance > 0").each do |u|
      bet_percentage = rand(bet_range)
      u.balance > 1000 ? bet = bet_percentage * u.balance : bet = u.balance
      UserRound.create(user:u , round: round, amount: -bet, color: selector.random, bet: bet, percentage: bet_percentage)
      u.balance += -bet
      u.save
    end
    round.update(color: selector.random)
    self.end_game(round)
  end

  def self.end_game(round)
    round.user_rounds.each do |ur|
      if ur.color == round.color
        user_balance = ur.user.balance
        bet = ur.bet
        ur.green? ? win = (user_balance + bet*15) :  win = (user_balance + bet*2)
        ur.user.update(balance: user_balance + win)
        ur.update(amount: win)
      end
    end
    structured_data = {id: round.id, color: I18n.t(round.color), details: round.user_rounds.map{ |p| {name: p.user.to_s, color: I18n.t(p.color), bet: p.bet, percentage: (p.percentage*100).to_i, amount: p.amount, background: (p.amount > 0 ? "row bg-success text-white p-1" : "row bg-danger text-white p-1"), text: (p.amount > 0 ? "Victoria" : "Derrota")}}}
    ActionCable.server.broadcast "game_room_channel", structured_data
  end
end
