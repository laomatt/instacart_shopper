require 'csv'
require 'json'
require 'mysql2'
require 'byebug'
require 'date'

client = Mysql2::Client.new(
    :host => '127.0.0.1',
    :username => 'root',
    :password => '',
    :database => 'applicants'
  );

workflow_states = client.query("select distinct(workflow_state) from applicants")
states = []
workflow_states.each do |res|
	states << res["workflow_state"]
end

weeks = []

start_date = Date.parse(ARGV[0])
end_date = Date.parse(ARGV[1])

while start_date < end_date
	weeks << {
		start: (start_date + 1).strftime("%Y-%m-%d"),
		end: (start_date + 7).strftime("%Y-%m-%d"),
	}

	start_date = start_date + 7

end


CSV.open("application_stats.csv", "w") do |csv|
  csv << ["count","week", "workflow_state"]
  weeks.each do |week|
  	row = []
  	states.each do |state|
		  results = client.query("SELECT workflow_state FROM applicants WHERE workflow_state='#{state}' AND updated_at >= '#{week[:start]}' AND updated_at < '#{week[:end]}'")
		  next if results.size == 0
		  p [results.size, week[:start], state]
	  	csv << [results.size, week[:start], state]
  	end

  end

end
