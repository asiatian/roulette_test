class Weather < ApplicationRecord

  def self.update_week
    today = Date.current
    url = "https://api.meteomatics.com/#{today.to_s}T16:00:00.000Z--#{(today + 1.week).to_s}T16:00:00.000Z:P1D/t_2m:C/-33.425596,-70.692112_-33.4785698,-70.6249963:0.1,0.1/json?model=mix"
    weather_report = JSON.load(URI.open(url, :http_basic_authentication => [Rails.application.credentials[:meteomatics_user], Rails.application.credentials[:meteomatics_pass]]))["data"].first["coordinates"].first["dates"]
    weather_report.each do |day|
     weather = self.find_or_initialize_by(date: day["date"].to_date)
     weather.temperature = day["value"]
     weather.save
    end
  end

  def self.bet_range
    today = Date.current
    Weather.where(date: today..(today + 1.week)).pluck(:temperature).each do |temperature|
      return 0.03..0.07 if temperature > 20
    end
    return 0.08..0.15

  end

end
