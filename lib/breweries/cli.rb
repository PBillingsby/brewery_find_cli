class CLI # CONTROLLER
 
  def start
    puts " -----------------------"
    puts "|     ** WELCOME **     |"
    puts "|                       |"
    puts "| TO THE BREWERY FINDER |"
    puts "|          CLI          |"
    puts " ----------------------- "
    menu
     # ADD CONDITIONAL TO SEE IF USER WANTS TO LIST BY STATE OR FIND BY NAME
  end
  
  def menu
    puts "Type the state you would like to browse breweries in:"
    @input = gets.strip.downcase.gsub(/\s+/, "_")
    correct_state = @@states.select{|state| state == @input} 
    if correct_state.empty?
      puts "Please type full state name"
      menu
    else
      list_or_find
    end
  end

  def list_or_find
    BreweryAPI.brewery_by_state(@input)
    list_brewery_names
  end

  def list_brewery_names
    
    Brewery.all.each.with_index(1) {|brewery, index| puts "#{index}. #{brewery.name} in #{brewery.city}, #{brewery.state}"}
    
    puts "Type number to get more information on brewery or 'exit' to start again"
    brew_input = gets.strip.downcase
    binding.pry
    if brew_input.class == Integer && brew_input <= 20
      brew_selection = Brewery.all[brew_input.to_i - 1] # Takes user input to index number minus 1 to account for indexing starting at 0
      puts "You have chosen #{brew_selection.name}, a #{brew_selection.brewery_type} located in #{brew_selection.city}, #{brew_selection.state}."
      puts "Do you wish to visit their website? 'y/n'"
      list_web_input = gets.strip
      if list_web_input == 'y'
        sleep(0.5)
        system("open", Brewery.all[brew_input - 1].website_url) # Opens external link to selected brewery
      else
        Brewery.clear_all
        start
      end
    end
  end
  @@states = ["alaska", # Changed states to match @input and remove one line of code
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
