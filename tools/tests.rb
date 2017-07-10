
## My Tests
luis = Customer.new("Luis", "Arita")
puts luis.full_name

puts "@@all"
elena = Customer.new("Elena", "Erazo")
Customer.all.each do |customer|
  puts customer.full_name
end

puts "== find_by_name"
puts Customer.find_by_name("Elena Erazo").full_name

puts "== find_all_by_first_name"
luis2 = Customer.new("Luis", "Ramos")
Customer.find_all_by_first_name("luis").each do |customer|
  puts customer.full_name
end

puts "== all_names"
Customer.all_names("luis").each do |customer|
  puts customer
end

puts "== Add Review"
rest1 = Restaurant.new("Rest 1")
rest2 = Restaurant.new("Rest 2")
luis.add_review(rest1, "Good")
luis.add_review(rest2, "Bad")
luis.add_review(rest1, "Not so good")
elena.add_review(rest1, "very good")

puts "== Content"
rest1.reviews.each do |review|
  puts review.content
end

puts "== All Reviews"
Review.all.each do |review|
  puts review.content
end

puts "== All Restaurant"
Restaurant.all.each do |restaurant|
  puts restaurant.name
end

puts "== find_by_name"
puts Restaurant.find_by_name("Rest 2").name

puts "== reviews"
rest1.reviews.each do |review|
  puts review.content
end

puts "== customers"
rest1.customers.each do |customer|
  puts customer.full_name
end