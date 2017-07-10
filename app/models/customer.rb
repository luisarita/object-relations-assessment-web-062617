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
