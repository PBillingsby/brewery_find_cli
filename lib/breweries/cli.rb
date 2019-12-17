class CLI # CONTROLLER
 
  def start
    puts " -----------------------"
    puts "|      * WELCOME *      |"
    puts "|        TO THE         |"
    puts "|    BREWERY FINDER     |"
    puts " ----------------------- "
    menu
  end
  
  # Menu gives options to either search by state, by name, or to exit program.
  def menu # Instance method (Instance of CLI)
    puts "Do you wish to list brewery by state or by name?"
    puts "Type 'state' or 'name'"
    puts "Type 'exit' at any time to exit."
    menu_input = gets.chomp.gsub(/\s+/, "") # Removes whitespace in menu_input
    case menu_input
    when 'name'
      list_brewery_by_name
    when 'state'
      list_menu
    when 'exit'
      exit
    else
      start # If input is anything but the case arguments, restart.
    end
  end

  def list_brewery_by_name  
    puts "Type brewery name to find brewery:"
    name_input = gets.strip
    if name_input == 'exit'
      exit
    end
    BreweryAPI.brewery_by_name(name_input)
    first_brewery = []
    first_brewery << Brewery.all.first # Returns first brewery found.
    if first_brewery[0] == nil # If brewery not found
      puts "Brewery not found. Try again."
      list_brewery_by_name
    elsif name_input == 'exit'
      exit
    else
        first_brewery.collect do |found_brewery| 
          puts "BREWERY: #{found_brewery.name}."  
          puts "LOCATION: #{found_brewery.street}."
          puts "CITY: #{found_brewery.city}."
          puts "STATE: #{found_brewery.state}."
          puts "WEBSITE: #{found_brewery.website_url}"
          puts "Do you wish to visit the #{found_brewery.name} website? (Opens external link) Type y/n"
          find_web_input = gets.strip.gsub(/\s+/, "")
          case find_web_input
          when 'y'
            sleep(0.5)
            system("open", found_brewery.website_url)
            clear_all
            start
          when 'n'
            puts "Taking you to main menu"
            clear_all
            start
          when 'exit'
            exit
          else
            puts "Input not recognized. Try again."
            clear_all
            start
          end
        end
    end
  end 
  
  def list_menu
    puts "Type state to see breweries:"
    @list_input = gets.strip.downcase .gsub(/\s+/, "_") # Instance variable to be accessed in list_brewery_names
    if @list_input == 'exit'
      exit
    end
    correct_state = STATES.select{|state| state == @list_input} # Checks if user input state is in states array of US states.
    if correct_state.empty?
      puts "Type full state name:"
      list_menu
    else
      list_brewery_names
    end
  end

  def list_brewery_names # Lists by state
    BreweryAPI.brewery_by_state(@list_input)
    Brewery.all.each.with_index(1) {|brewery, index| puts "#{index}. #{brewery.name} - #{brewery.street}, #{brewery.city}, #{brewery.state}."}
    puts "Type the number to get more information on brewery."
    selected_brewery = gets.chomp
    unless selected_brewery.to_s =~ /[0-9]+/ || selected_brewery == 'exit'
      puts "Brewery not found."
      clear_all
      start
    end
    user_brewery_obj = Brewery.all[selected_brewery.to_i - 1] # Takes user input to index number minus 1 to account for indexing starting at 0 
    if selected_brewery == 'exit'
      exit
    elsif selected_brewery.to_i > Brewery.all.count || selected_brewery[0] == '-' # Accounts for selected_brewery selection being greater than Brewery count and also accounts for '-' minus input
      puts "Brewery not found."
      clear_all
      start
    elsif selected_brewery.to_i <= Brewery.all.count 
      puts "BREWERY: #{user_brewery_obj.name}." # 
      puts "LOCATION: #{user_brewery_obj.street}."
      puts "CITY: #{user_brewery_obj.city}."
      puts "STATE: #{user_brewery_obj.state}."
      puts "WEBSITE: #{user_brewery_obj.website_url}."
      puts "Do you wish to visit the #{user_brewery_obj.name} website? (Opens external link) Type y/n"
      open_web = gets.strip
      if user_brewery_obj.website_url == "" && open_web == 'y' # If no link to brewery, restart app
        puts "No link to brewery website."
        clear_all
        sleep(1)
        start
      elsif open_web == 'exit'
        exit
      elsif open_web == 'y'
        puts "Redirecting you now."
        sleep(0.5) # Waits half a second to open link.
        system("open", Brewery.all[selected_brewery.to_i - 1].website_url) # Opens external link to selected brewery
        clear_all
        start
      elsif open_web == 'n'
        clear_all
        start
      end
    end
  end

  def clear_all
    Brewery.all.clear
  end

  STATES = ["alaska", # Changed states to match input and remove one line of code
  "alabama",
  "arkansas",
  "arizona",
  "california",
  "colorado",
  "connecticut",
  "district_of_columbia",
  "delaware",
  "florida",
  "georgia",
  "guam",
  "hawaii",
  "iowa",
  "idaho",
  "illinois",
  "indiana",
  "kansas",
  "kentucky",
  "louisiana",
  "massachusetts",
  "maryland",
  "maine",
  "michigan",
  "minnesota",
  "missouri",
  "mississippi",
  "montana",
  "north_carolina",
  "north_dakota",
  "nebraska",
  "new_hampshire",
  "new_jersey",
  "new_mexico",
  "nevada",
  "new_york",
  "ohio",
  "oklahoma",
  "oregon",
  "pennsylvania",
  "puerto_rico",
  "rhode_island",
  "south_carolina",
  "south_dakota",
  "tennessee",
  "texas",
  "utah",
  "virginia",
  "vermont",
  "washington",
  "wisconsin",
  "west_virginia",
  "wyoming"]
end