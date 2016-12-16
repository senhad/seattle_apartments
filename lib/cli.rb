class Cli

  def initialize
    Scraper.scrape_listings
    puts "This is your preview of latest apartment listings in Seattle"
    sleep(1)
    list_listings
    menu
    goodbye
  end

  def menu
    input = ""
    while input != "exit"
      puts "Enter the number of the listing you would additional details for, type list to see the list again or type exit"
      input = gets.strip.downcase
      case input
      when "exit"
        break
      when "list"
        list_listings
      else
       href = Listing.all[input.to_i - 1].url
        doc = Nokogiri::HTML(open(href))
        Listing.all[input.to_i - 1].description = doc.css('#postingbody').text.gsub(/QR Code Link to This Post/, '').strip
        puts "---------ADDITIONAL DETAILS---------"
        puts Listing.all[input.to_i - 1].title
        puts "PRICE: #{Listing.all[input.to_i - 1].price}"
        puts "LOCATION: #{Listing.all[input.to_i - 1].location}"
        puts "DESCRIPTION: #{Listing.all[input.to_i - 1].description}"
        end
      end
    end

  def list_listings
    Listing.all.each.with_index(1) do |listing, i|
    puts "#{i}. #{listing.title}"
    end
  end


  def goodbye
    puts "Goodbye, see you next time!"
  end

end
