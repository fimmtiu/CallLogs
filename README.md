# Call Logging Sample App

Imagine that you need an app for managing a call centre. The **users** are
support agents, who receive calls from **customers**. Every time they
handle a call from a customer, they file a **log** of the call which
records its duration and a summary of the discussion.

This is a sample Rails app which implements such a system. It's not very
pretty, and not very complete, but it gets the job done. Unfortunately,
it's got some problems with how it uses the database. Have a look at the
schema and the code; **see if you can figure out where this app might run
into trouble** if it had hundreds of thousands of customers and millions of
call logs.

It's okay if you're not familiar with Ruby! We've put comments next to all
the ActiveRecord calls which show the SQL they generate. If you find a
problem, you're not expected to rewrite the ActiveRecord code to fix it;
just saying what approach would work better in SQL is enough. Feel free to
ask as many questions as you like! We're happy to serve as your Google
replacement.

You don't have to look at the users table, authentication code, or specs
for this. That's all boilerplate that we don't care about. All the code
that's relevant to this test is in the following files:

```
db/migrate/20160829204928_create_customers.rb
db/migrate/20160829220123_create_logs.rb
app/models/customer.rb
app/models/log.rb
app/controllers/customers_controller.rb
app/controllers/logs_controller.rb
app/controllers/dashboard_controller.rb
app/views/customers/index.html.erb
app/views/logs/index.html.erb
app/views/dashboard/index.html.erb
```

Try the app out yourself! https://clio-call-logs.herokuapp.com/
* Login: demo@goclio.com
* Password: testtest

(If the Heroku app has an empty dashboard, you'll want to reseed the
database with `heroku pg:reset DATABASE && heroku run rake db:migrate
db:seed`.)

If you'd like to generate an egregiously large data set locally to test
with, pass `HUGE=1` as an environment variable to `rake db:seed` -- beware,
though, it'll be very slow. (And don't try it on Heroku!)
