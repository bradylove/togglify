namespace :togglify do
  desc "Enable a Togglify toggle"
  task :enable, [:toggle] => :environment do |t, args|
    Togglify.enable(args[:toggle])
    puts "Enabled #{args[:toggle]} for #{Rails.env}"
  end

  desc "Disable a Togglify toggle"
  task :disable, [:toggle] => :environment do |t, args|
    Togglify.disable(args[:toggle])
    puts "Disabled #{args[:toggle]} for #{Rails.env}"
  end
end
