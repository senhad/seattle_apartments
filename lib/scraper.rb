

class Scraper

  attr_accessor :doc, :desc

  def self.scrape_listings
    @doc = Nokogiri::HTML(open("https://seattle.craigslist.org/search/apa"))
    @doc.css('.result-row')[0..9].each do |listing|
      l = Listing.new
      l.title = listing.css('.result-title.hdrlnk').text.strip
      l.price = "$#{listing.css('.result-price').text.split("$")[1]}"
      l.location = listing.css('.result-hood').text.strip
      l.url = "https://seattle.craigslist.org#{listing.css("a").attr('href').value}"
      Listing.all << l
    end
    Listing.all
  end

end
