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

