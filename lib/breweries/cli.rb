class CLI # CONTROLLER
 
  def start
    puts "Welcome...."
    puts "Type in a state to list breweries: "
    @input = gets.strip.downcase
    BreweryAPI.brewery_by_state(@input)
    # puts "Do you want to list by state or by name?"
    # gets.chomp
    list_brewery_names # ADD CONDITIONAL TO SEE IF USER WANTS TO LIST BY STATE OR FIND BY NAME
  end

  def list_brewery_names
    Brewery.all.each.with_index(1) {|brewery, index| puts "#{index}. #{brewery.name} in #{brewery.city}, #{brewery.state}"}
    puts "Type number to get more information on brewery"
    puts "Pressing enter will open to an external brewery website."
    brew_input = gets.chomp.to_i
    brew_selection = Brewery.all[brew_input - 1]
    brew_selection
    sleep(0.5)
    system("open", Brewery.all[brew_input - 1].website_url) # Opens external link to selected brewery
  end

  # def list_brewery_by_type
  #   Brewery.all.list_brewery_by_type
  # end
end
