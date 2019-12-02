class CLI # CONTROLLER
 
  def start
    puts " -----------------------"
    puts "|     ** WELCOME **     |"
    puts "|                       |"
    puts "| TO THE BREWERY FINDER |"
    puts "|          APP          |"
    puts " ----------------------- "
    menu
  end
  
  # Menu gives options to either search by state, by name, or to exit program.
  def menu
    puts "Do you wish to list brewery by state or by name?"
    puts "Type 'list', 'name' or 'exit' to exit:"
    menu_input = gets.chomp.gsub(/\s+/, "")
    case menu_input
    when 'list'
      list_menu
    when 'name'
      list_brewery_by_name
    when 'exit'
      exit
    else
      start # If input is anything but the case arguments, restart.
    end
  end

  def list_brewery_by_name  
    puts "Type brewery name:"
    @name_input = gets.strip
    BreweryAPI.brewery_by_name(@name_input)
    @found_brewery = []
    @found_brewery << Brewery.all.first # Returns first brewery found.
    if @found_brewery[0] == nil # If brewery not found
      puts "Brewery not found. Try again"
      list_brewery_by_name
    else
        @found_brewery.collect do |key| 
          puts "#{key.name} is located at #{key.street} in #{key.city}, #{key.state}."
          puts "Do you wish to visit the #{key.name} website? Type y/n"
          find_web_input = gets.strip.gsub(/\s+/, "")
          case find_web_input
          when 'y'
            sleep(0.5)
            system("open", key.website_url)
            start
          when 'n'
            puts "Taking you to main menu"
            Brewery.clear_all
            start
          else
            puts "Input not recognized. Please try again."
            Brewery.clear_all
            start
          end
        end
    end
  end 
  
  def list_menu
    puts "Type state to see breweries:"
    @list_input = gets.strip.downcase.gsub(/\s+/, "_")
    correct_state = @@states.select{|state| state == @list_input} # Checks if user input state is in @@states array of US states.
    if correct_state.empty?
      puts "Please type full state name"
      list_menu
    else
      list_brewery_names
    end
  end

  def list_brewery_names
    BreweryAPI.brewery_by_state(@list_input)
    Brewery.all.each.with_index(1) {|brewery, index| puts "#{index}. #{brewery.name} in #{brewery.city}, #{brewery.state}"}
    puts "Type number to get more information on brewery, 'exit' to start again"
    list_options = gets.strip.downcase
    int_list_options = list_options.to_i
    brew_selection = Brewery.all[int_list_options - 1] # Takes user input to index number minus 1 to account for indexing starting at 0 
    
    if int_list_options <= 20 && list_options != 'exit'
      puts "You have chosen #{brew_selection.name}, a #{brew_selection.brewery_type} located at #{brew_selection.street} in #{brew_selection.city}, #{brew_selection.state}. "
      puts "Do you wish to visit their website? 'y/n'"
      list_web_input = gets.strip
      if brew_selection.website_url == "" && list_web_input == 'y' # If no link to brewery, restart app
        puts "No link to brewery website. Try again."
        Brewery.clear_all
        sleep(1)
        start
      elsif list_web_input == 'y'
        puts "Redirecting you now."
        sleep(0.5) # Waits half a second to open link.
        system("open", Brewery.all[brew_input - 1].website_url) # Opens external link to selected brewery
      elsif list_web_input == 'exit' || list_web_input == 'n'
        Brewery.clear_all
        start
      end
    elsif list_options == 'exit'
      Brewery.clear_all
      start
    else
      puts "Brewery not in list."
      puts "Please try again."
      Brewery.clear_all
      start
    end
  end
end