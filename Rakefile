# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :import do
  desc "Import pdfs in 2020 directory"
  task :twentytwenty => :environment do
    Scraper.new.import('2020')
  end
end