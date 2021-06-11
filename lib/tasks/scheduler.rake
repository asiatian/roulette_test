desc "This task is called by the Heroku scheduler add-on"
task :update_week => :environment do
  puts "Updating week..."
  Weather.update
  puts "done."
end

task :play => :environment do
  puts "Playing..."
  RoundsController.start_game
  puts "done."
end

task :user_updtae => :environment do
  puts "Recharching Pockets..."
  User.new_day
  puts "done."
end
