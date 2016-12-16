

class Scraper

  attr_accessor :doc


  def self.scrape_listings
    @doc = Nokogiri::HTML(open("https://seattle.craigslist.org/search/apa"))
    @doc.css('.result-row').each do |listing|
      l = Listing.new 
      l.title = listing.css('.result-title.hdrlnk').text
      l.price = "$#{listing.css('.result-price').text.split("$")[1]}"
      l.location = listing.css('.result-hood').text
      l.url = listing.css("a").attr('href').value
      Listing.all << l
    end 
  end 
  
  
  def scrape_description
  end 

end 


  