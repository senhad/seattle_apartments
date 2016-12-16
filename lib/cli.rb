puts "This is your preview of latest apartment listings in Seattle"

Scraper.scrape_listings

Listing.all.each.with_index(1) do |l, i|
  puts "#{i}. #{l.title}"
  end 
