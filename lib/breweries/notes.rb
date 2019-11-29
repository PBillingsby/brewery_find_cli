# ORIGINAL LIST BY STATE CLASS NOW UPDATED WITH SEARCH BY NAME OPTION!

# class CLI # CONTROLLER
 
#   def start
#     puts " -----------------------"
#     puts "|     ** WELCOME **     |"
#     puts "|                       |"
#     puts "| TO THE BREWERY FINDER |"
#     puts "|          APP          |"
#     puts " ----------------------- "
#     menu
#      # ADD CONDITIONAL TO SEE IF USER WANTS TO LIST BY STATE OR FIND BY NAME
#   end
  
#   def menu
#     puts "Type state to see breweries:"
#     @input = gets.strip.downcase.gsub(/\s+/, "_")
#     # NEXT PAGE VARIABLE TO WORK ON! 
#     # next_page = 'https://api.openbrewerydb.org/breweries?by_state=' + @input + '&page=2'
#     correct_state = @@states.select{|state| state == @input} 
#     if correct_state.empty?
#       puts "Please type full state name"
#       menu
#     else
#       list
#     end
#   end

#   def list
#     BreweryAPI.brewery_by_state(@input)
#     list_brewery_names
#   end

#   def list_brewery_names
#     Brewery.all.each.with_index(1) {|brewery, index| puts "#{index}. #{brewery.name} in #{brewery.city}, #{brewery.state}"}
#     puts "Type number to get more information on brewery, 'exit' to start again"
#     list_options = gets.strip.downcase
#     brew_input = list_options.to_i
#     brew_selection = Brewery.all[brew_input - 1] # Takes user input to index number minus 1 to account for indexing starting at 0 
#     if brew_selection == nil
#       puts "Brewery not in list."
#       puts "Do you wish to try again or return to start? Type 'list' or 'start'"
#       list_or_menu = gets.strip
#       case list_or_menu
#       when 'list'
#         list_brewery_names
#       when 'start'
#         start
#       end
#     elsif list_options == 'exit'
#       start
#     elsif brew_input <= 20
#       puts "You have chosen #{brew_selection.name}, a #{brew_selection.brewery_type} located at #{brew_selection.street} in #{brew_selection.city}, #{brew_selection.state}. "
#       puts "Do you wish to visit their website? 'y/n'"
#       list_web_input = gets.strip
#     else
#       start
#     end

#     if brew_selection.website_url == "" && list_web_input == 'y' # If no link to brewery, restart app
#       puts "No link to brewery website. Try again."
#       Brewery.clear_all
#       sleep(1)
#       start
#     elsif list_web_input == 'y'
#       puts "Redirecting you now."
#       sleep(0.5) # Waits half a second to open link.
#       system("open", Brewery.all[brew_input - 1].website_url) # Opens external link to selected brewery
#     elsif list_web_input == 'exit' || list_web_input == 'n'
#       Brewery.clear_all
#       start
#     end
#   end


#   @@states = ["alaska", # Changed states to match @input and remove one line of code
#   "alabama",
#   "arkansas",
#   "arizona",
#   "california",
#   "colorado",
#   "connecticut",
#   "district_of_columbia",
#   "delaware",
#   "florida",
#   "georgia",
#   "guam",
#   "hawaii",
#   "iowa",
#   "idaho",
#   "illinois",
#   "indiana",
#   "kansas",
#   "kentucky",
#   "louisiana",
#   "massachusetts",
#   "maryland",
#   "maine",
#   "michigan",
#   "minnesota",
#   "missouri",
#   "mississippi",
#   "montana",
#   "north_carolina",
#   "north_dakota",
#   "nebraska",
#   "new_hampshire",
#   "new_jersey",
#   "new_mexico",
#   "nevada",
#   "new_york",
#   "ohio",
#   "oklahoma",
#   "oregon",
#   "pennsylvania",
#   "puerto_rico",
#   "rhode_island",
#   "south_carolina",
#   "south_dakota",
#   "tennessee",
#   "texas",
#   "utah",
#   "virginia",
#   "vermont",
#   "washington",
#   "wisconsin",
#   "west_virginia",
#   "wyoming"]
# end
