class RoundsController < ApplicationController
  # POST /round
  def self.start_game
    selector  = WalkerMethod.new(Round.colors.values, [2,49,49])
    round     = Round.create()
    bet_range = Weather.bet_range
    round.save
    User.where("balance > 0").each do |u|
      u.balance > 1000 ? bet = rand(bet_range) * u.balance : bet = u.balance
      UserRound.create(user:u , round: round, amount: bet, color: selector.random)
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
        amount = ur.amount
        ur.green? ? ur.user.update(balance: user_balance + amount*15) : ur.user.update(balance: user_balance + amount*2)
      end
    end
    structured_data = {id: round.id, color: I18n.t(round.color), details: round.user_rounds.map{|r| {name: r.user.to_s, color: I18n.t(r.color), amount: r.outcome}}}
    ActionCable.server.broadcast "game_room_channel", structured_data
  end

end
