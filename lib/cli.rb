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
      puts "ENTER THE NUMBER OF THE LISTING YOU WOULD ADDITIONAL DETAILS FOR, TYPE LIST TO SEE THE LIST AGAIN OR TYPE EXIT:"
      input = gets.strip.downcase
      case input
      when "exit"
        break
      when "list"
        list_listings
      else
        Scraper.scrape_additional_details(input)
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
