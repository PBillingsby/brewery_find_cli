class CLI # CONTROLLER
 
  def start
    puts " -----------------------"
    puts "|     ** WELCOME **     |"
    puts "|                       |"
    puts "| TO THE BREWERY FINDER |"
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
    @first_brewery = []
    @first_brewery << Brewery.all.first # Returns first brewery found.
    if @first_brewery[0] == nil # If brewery not found
      puts "Brewery not found. Try again"
      list_brewery_by_name
    else
        @first_brewery.collect do |found_brewery| 
          puts "BREWERY: \e[0;4;94m#{found_brewery.name}\e[0m."
          puts "LOCATION: #{found_brewery.street}."
          puts "CITY: #{found_brewery.city}."
          puts "STATE: #{found_brewery.state}."
          puts "Do you wish to visit the \e[0;4;94m#{found_brewery.name}\e[0m website? Type y/n"
          find_web_input = gets.strip.gsub(/\s+/, "")
          case find_web_input
          when 'y'
            sleep(0.5)
            system("open", found_brewery.website_url)
            start
          when 'n'
            puts "Taking you to main menu"
            clear_all
            start
          else
            puts "Input not recognized. Please try again."
            clear_all
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
    # Brewery.all.each.with_index(1) {|brewery, index| puts "#{index}. #{brewery.name}\n #{brewery.street}, #{brewery.city}, #{brewery.state}.\n"}
    Brewery.all.each.with_index(1) do |brewery, index|
      puts "#{index}. \e[0;4;94m#{brewery.name}\e[0m: #{brewery.street}, #{brewery.city}, #{brewery.state}."
    end
    puts "Type number to get more information on brewery, 'exit' to start again"
    selected_brewery = gets.strip.downcase
    selected_to_int = selected_brewery.to_i
    user_brewery_obj = Brewery.all[selected_to_int - 1] # Takes user input to index number minus 1 to account for indexing starting at 0 
    
    if selected_to_int <= 20 && selected_brewery != 'exit'
      puts "\e[0;4;94m#{user_brewery_obj.name}\e[0m, a #{user_brewery_obj.brewery_type} located at #{user_brewery_obj.street} in #{user_brewery_obj.city}, #{user_brewery_obj.state}. "
      puts "Do you wish to visit the \e[0;4;94m#{user_brewery_obj.name}\e[0m website? 'y/n'"
      open_web = gets.strip
      if user_brewery_obj.website_url == "" && open_web == 'y' # If no link to brewery, restart app
        puts "No link to brewery website. Try again."
        clear_all
        sleep(1)
        start
      elsif open_web == 'y'
        puts "Redirecting you now."
        sleep(0.5) # Waits half a second to open link.
        system("open", Brewery.all[selected_to_int - 1].website_url) # Opens external link to selected brewery
      elsif open_web == 'exit' || open_web == 'n'
        clear_all
        start
      end
    elsif selected_brewery == 'exit'
      clear_all
      start
    else
      puts "Brewery not in list."
      puts "Please try again."
      clear_all
      start
    end
  end

  def clear_all
    Brewery.all.clear
  end
end