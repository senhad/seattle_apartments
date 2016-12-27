class Listing
  attr_accessor :title, :price, :location, :description, :url

  @@all = []

  def initialize(title, price, location, url)
    @title = title
    @price = price
    @location = location
    @url = url 
  end

  def self.all
    @@all
  end

  def self.find_by_number(index)
    Listing.all[index]
  end
end
