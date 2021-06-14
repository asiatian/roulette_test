class DashboardController < ApplicationController
  def index
    @date = Date.current.strftime("%d-%m-%Y")
    @bets = UserRound.includes(:user, :round).all.order(id: :desc).group_by(&:round_id)
    @formated_bets = {}
    @bets.each do |game_number, plays|
      @formated_bets[game_number] = {color: I18n.t(plays.first.round.color), plays: plays.map{ |p| {name: p.user.to_s, color: I18n.t(p.color), bet: p.bet, percentage: (p.percentage*100).to_i, amount: p.amount, background: (p.amount > 0 ? "row bg-success text-white p-1" : "row bg-danger text-white p-1"), text: (p.amount > 0 ? "Victoria" : "Derrota")} }}
    end
  end

  def self.do_daily
    User.new_day
    Weather.update_week
  end
end
