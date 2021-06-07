class DashboardController < ApplicationController
  def index
    @date = Date.current.strftime("%d-%m-%Y")
  end
end
