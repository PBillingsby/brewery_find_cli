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
    @input = gets.strip.downcase
    correct_state = @@states.select{|state| state == @input.capitalize} 
    if correct_state.empty?
      puts "Please type full state name"
      menu
    else
      list_or_find
    end
  end

  def list_or_find
    # @user_choice = gets.strip.downcase
    BreweryAPI.brewery_by_state(@input)

    list_brewery_names
    # if @user_choice == 'list'
    #   BreweryAPI.brewery_by_state(@user_choice)
    #   list_brewery_names
    # elsif @user_choice == 'find'
    #   BreweryAPI.brewery_by_name(@user_choice)
    #   list_brewery_by_name
    #   Brewery.all.clear
    # end
  end

  def list_brewery_names
    
    Brewery.all.each.with_index(1) {|brewery, index| puts "#{index}. #{brewery.name} in #{brewery.city}, #{brewery.state}"}
    
    puts "Type number to get more information on brewery or 'exit' to start again"
    brew_input = gets.strip.downcase.to_i
    if brew_input.class == Integer && brew_input <= 20 
      # puts "Please type number between 1-20:"
      # '\n'
      brew_selection = Brewery.all[brew_input - 1] # Takes user input to index number minus 1 to account for indexing starting at 0
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
  @@states = ["Alaska",
  "Alabama",
  "Arkansas",
  "American Samoa",
  "Arizona",
  "California",
  "Colorado",
  "Connecticut",
  "District of Columbia",
  "Delaware",
  "Florida",
  "Georgia",
  "Guam",
  "Hawaii",
  "Iowa",
  "Idaho",
  "Illinois",
  "Indiana",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Massachusetts",
  "Maryland",
  "Maine",
  "Michigan",
  "Minnesota",
  "Missouri",
  "Mississippi",
  "Montana",
  "North Carolina",
  " North Dakota",
  "Nebraska",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "Nevada",
  "New York",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Puerto Rico",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Virginia",
  "Virgin Islands",
  "Vermont",
  "Washington",
  "Wisconsin",
  "West Virginia",
  "Wyoming"]
end
  #COMMENTING THIS METHOD OUT UNTIL I CAN FINISH FIRST METHOD.
  # def list_brewery_by_name  
  #   @found_brewery = []
  #   @found_brewery << Brewery.all.first
  #   @found_brewery.collect do |key| 
  #     puts "#{key.name} is located in #{key.city}."
  #     puts "Do you wish to visit the #{key.name} website? Type 'yes' or 'no'"
  #     find_web_input = gets.strip
      
  #     if find_web_input == 'yes'
  #       sleep(0.5)
  #       system("open", key.website_url)
  #       start
  #     elsif find_web_input == 'no'
  #       puts "Taking you to main menu"
  #       Brewery.all.clear
  #       start
  #     else
  #       puts "Please type yes or no"
  #       list_brewery_by_name
  #     end
  #   end
  #   # Brewery.all.clear
  # end #MUST MAKE WORK
