class DashboardController < ApplicationController
  def index
    @date = Date.current.strftime("%d-%m-%Y")
    @bets = UserRound.includes(:user, :round).all.group_by(&:round_id)
  end

  def do_daily
    User.new_day
    Weather.update_week
  end
end
