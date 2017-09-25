#!/usr/bin/env ruby

#bundle exec /home/resrev/forex-economic-data/lib/tasks/scrape_investing_com_events.rb development_scraper
ENV['RAILS_ENV'] = ARGV[0] || 'production'
if %w(production_scraper development_scraper).include? ENV['RAILS_ENV']

DIR = File.dirname(__FILE__)
require DIR + '/../../config/environment'

puts 'hello world'

end
