class Cli


  def call
    Scraper.scrape_listings
    puts "This is your preview of the latest apartment listings in Seattle"
    sleep(1)
    list_listings
    menu
    goodbye
  end

  def menu
    input = ""
    while input != "exit"
      puts "ENTER THE NUMBER OF THE LISTING YOU WOULD ADDITIONAL DETAILS FOR, TYPE LIST TO SEE THE LIST AGAIN OR TYPE EXIT:"
      input = gets.strip.downcase
      case input
      when "exit"
        break
      when "list"
        list_listings
      else
        additional_details(input)
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

  def additional_details(input)
    Scraper.scrape_additional_details(input)
    listing = Listing.find_by_number(input.to_i - 1)
    puts "---------ADDITIONAL DETAILS---------"
    puts listing.title
    puts "PRICE: #{listing.price}"
    puts "LOCATION: #{listing.location}"
    puts "DESCRIPTION: #{listing.description}"
  end

end
