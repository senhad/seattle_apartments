class Listing
  attr_accessor :title, :price, :location, :description, :url

  @@all = []

  def self.all
    @@all
  end


end
