# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Dir[Rails.root.join("spec/factories/**/*.rb")].each {|f| require f}

if ENV['HUGE'].present?
  user_count = 50
  customer_count = 100_000
  log_count = 5_000_000
else
  user_count = 3
  customer_count = 10
  log_count = 50
end

print "Generating users... "
FactoryGirl.create(:user, name: "Demo User", email: "demo@goclio.com", password: "testtest")
(user_count - 1).times do |i|
  FactoryGirl.create(:user)
end
user_ids = User.all.pluck(:id)
puts "done.\n"

customer_count.times do |i|
  FactoryGirl.create(:customer)
  printf "\rGenerated %d of %d customers (%.1f%%)   ", i + 1, customer_count, (i + 1).to_f / customer_count * 100
end
customer_ids = Customer.all.pluck(:id)
print "\n"

log_count.times do |i|
  FactoryGirl.create(:log, user_id: user_ids.sample, customer_id: customer_ids.sample)
  printf "\rGenerated %d of %d logs (%.1f%%)   ", i + 1, log_count, (i + 1).to_f / log_count * 100
end

puts "\nDone."
