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


## Part 2

<p>I wrote a ruby script to generage the CSV, just run it using ruby.  It will create a csv file called 'application_stats.csv'</p>

<h5>instructions:</h5>
<p>first import the database into your local sql server</p>

	```
		gem install mysql2
		<br>
		ruby app.rb
	```