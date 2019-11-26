class CLI # CONTROLLER
 
  def start
    puts "Welcome...."
    puts "Do you want to list brewery by state or find by name? Type 'list' or 'find'"
    @input = gets.strip.downcase
    list_or_find
  
     # ADD CONDITIONAL TO SEE IF USER WANTS TO LIST BY STATE OR FIND BY NAME
  end
  
  def list_or_find
    puts "Enter name of state or brewery"
    @user_choice = gets.strip.downcase
    if @input == 'list'
      BreweryAPI.brewery_by_state(@user_choice)
      list_brewery_names
    elsif @input == 'find'
      BreweryAPI.brewery_by_name(@user_choice)
      list_brewery_by_name
    else 
      "error"
    end
  end

  def list_brewery_names
    Brewery.all.each.with_index(1) {|brewery, index| puts "#{index}. #{brewery.name} in #{brewery.city}, #{brewery.state}"}
    puts "Type number to get more information on brewery"
    
    brew_input = gets.strip.to_i
    brew_selection = Brewery.all[brew_input - 1] # Takes user input to index number minus 1 to account for indexing starting at 0
    brew_input.class == Integer && brew_input <= 20 ? brew_selection : "Please type number between 1-20"
    puts "#{brew_selection.name} is a #{brew_selection.brewery_type} located in #{brew_selection.city}, #{brew_selection.state}"
    
    puts "Do you wish to visit their website? Type 'yes' or 'exit'"
    web_input = gets.strip
    if web_input == 'yes'
      sleep(0.5)
      system("open", Brewery.all[brew_input - 1].website_url) # Opens external link to selected brewery
    elsif web_input == 'exit'
      Brewery.all.clear # Without this, the start method added whole list again incrementing count by 20
      start
    else
      puts "Please type either 'yes' or 'exit'"
    end
  end

  def list_brewery_by_name
    brew = Brewery.all.each.with_index do |brewery|
      if @user_choice === brewery.name
        puts brew.name
      end
    end
  end #MUST MAKE WORK

  @@states = {
      "Alabama" => "AL",
      "Alaska" => "AK",
      "Arizona" => "AZ",
      "Arkansas" => "AR",
      "California" => "CA",
      "Colorado" => "CO",
      "Connecticut" => "CT",
      "Delaware" => "DE",
      "Florida" => "FL",
      "Georgia" => "GA",
      "Hawaii" => "HI",
      "Idaho" => "ID",
      "Illinois" => "IL",
      "Indiana" => "IN",
      "Iowa" => "IA",
      "Kansas" => "KS",
      "Kentucky" => "KY",
      "Louisiana" => "LA",
      "Maine" => "ME",
      "Maryland" => "MD",
      "Massachusetts" => "MA",
      "Michigan" => "MI",
      "Minnesota" => "MN",
      "Mississippi" => "MS",
      "Missouri" => "MO",
      "Montana" => "MT",
      "Nebraska" => "NE",
      "Nevada" => "NV",
      "New Hampshire" => "NH",
      "New Jersey" => "NJ",
      "New Mexico" => "NM",
      "New York" => "NY",
      "North Carolina" => "NC",
      "North Dakota" => "ND",
      "Ohio" => "OH",
      "Oklahoma" => "OK",
      "Oregon" => "OR",
      "Pennsylvania" => "PA",
      "Rhode Island" => "RI",
      "South Carolina" => "SC",
      "South Dakota" => "SD",
      "Tennessee" => "TN",
      "Texas" => "TX",
      "Utah" => "UT",
      "Vermont" => "VT",
      "Virginia" => "VA",
      "Washington" => "WA",
      "West Virginia" => "WV",
      "Wisconsin" => "WI",
      "Wyoming" => "WY"
    }
end
