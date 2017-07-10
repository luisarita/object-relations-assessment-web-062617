# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  #Customer.all
  #should return all of the customers
  def self.all
    @@all
  end

  #Customer.find_by_name(name)
  #given a string of a full name, returns the first customer whose full name matches
  def self.find_by_name(name)
    @@all.find {|customer| customer.full_name.downcase == name.downcase}
  end

  #Customer.find_all_by_first_name(name)
  #given a string of a first name, returns an array containing all customers with that first name
    def self.find_all_by_first_name(name)
    @@all.select {|customer| customer.first_name.downcase == name.downcase}
  end
  #Customer.all_names
  #should return an array of all of the customer full names
  def self.all_names(name)
    @@all.map {|customer| customer.first_name + ' ' + customer.last_name}
  end

  #Customer#add_review(restaurant, content)
  #given some content and a restaurant, creates a new review and associates it with that customer and that restaurant
  def add_review(restaurant, content)
    Review.new(restaurant, self, content)
  end
end

class Review
    attr_reader :customer, :restaurant, :content
    @@all = []

    def initialize(restaurant, customer, content)
        @restaurant, @customer, @content = restaurant, customer, content
        @@all << self
    end

    #Review.all
    #returns all of the reviews
    def self.all
        @@all
    end
end

class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  #Restaurant.all
  #returns an array of all restaurants
  def self.all
    @@all
  end

  #Restaurant.find_by_name(name)
  #given a string of restaurant name, returns the first restaurant that matches
  def self.find_by_name(name)
    @@all.find {|restaurant| restaurant.name.downcase == name.downcase}
  end  
  
  #Restaurant#reviews
  #returns an array of all reviews for that restaurant
  def reviews()
    Review.all.select do |review| 
      review.restaurant == self
    end
  end  

  #Restaurant#customers
  #should return all of the customers who have written reviews of that restaurant.
  def customers()
    reviews.map {|review| review.customer}.uniq
  end  
end

