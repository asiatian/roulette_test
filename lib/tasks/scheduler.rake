desc "This task is called by the Heroku scheduler add-on"
task :update_week => :environment do
  puts "Updating week..."
  DashboardController.do_daily
  puts "done."
end

task :play => :environment do
  puts "Playing..."
  Round.start_game
  puts "done."
end
