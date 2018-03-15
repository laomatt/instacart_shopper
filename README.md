# README

## Configuration and setup

* Ruby version 2.6

* Database creation
	```
		rake db:create
	```

* Database initialization
	```
		rake db:migrate
		rake db:seed
	```

* How to run the test suite
	```
		rake spec
	```

* Deployment instructions
	```
		bundle install
	```

## Part 1

<p>Run it on localhost:3000</p>

* Deployment instructions
	```
		rails s
	```

## Part 2

<p>I wrote a ruby script to generage the CSV, just run it using ruby.  It will create a csv file called 'application_stats.csv'</p>

<h5>instructions:</h5>
<p>first import the database into your local sql server, name it 'applicants'</p>

* Deployment instructions
	```
		gem install mysql2
		ruby app.rb 2014-1-15 2015-1-15
	```
	