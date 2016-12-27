

class Scraper

  attr_accessor :doc, :desc

  def self.scrape_listings
    @doc = Nokogiri::HTML(open("https://seattle.craigslist.org/search/apa"))
    @doc.css('.result-row')[0..9].each do |listing|
      title = listing.css('.result-title.hdrlnk').text.strip
      price = "$#{listing.css('.result-price').text.split("$")[1]}"
      location = listing.css('.result-hood').text.strip
      url = "https://seattle.craigslist.org#{listing.css("a").attr('href').value}"
      new_listing = Listing.new(title, price, location, url)
      Listing.all << new_listing
    end
  end


  def self.scrape_additional_details(input)
     href = Listing.all[input.to_i - 1].url
     doc = Nokogiri::HTML(open(href))
     Listing.all[input.to_i - 1].description = doc.css('#postingbody').text.gsub(/QR Code Link to This Post/, '').strip
  end

end
