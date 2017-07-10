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
