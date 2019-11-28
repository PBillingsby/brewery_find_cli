# # puts "Please enter a state: " TEST
# # user_input = gets.chomp
# def brew_by_state
#   brew_state = 'https://api.openbrewerydb.org/breweries?by_state=new_york'
#   state_response = HTTParty.get(brew_by_state)
#   state_formatted = state_response.each do |brew_obj|
#     brew_obj.each {|k_obj, v_obj| puts "#{k_obj}: #{v_obj}"}
#   end
#   state_formatted
# end

# def brew
#   puts "What brewery would you like to find?"
#   brew_input = gets.chomp.downcase.gsub(/\s+/, "") # Gets, downcases and removes space in user input
#   brew_link = 'http://prost.herokuapp.com/api/v1/brewery/' + brew_input # Concatenates user input brewery to end link
#   response = HTTParty.get(brew_link)
#   response.each do |k, v|
#     puts "#{k} is #{v}"
#   end
#   puts response
# end
# # def brew_by_name
# #   brew_name = 'https://api.openbrewerydb.org/breweries?by_name=tired_hands' #Going through individual breweries and displaying key and value.
# #   response = HTTParty.get(brew_by_name)
# #   formatted = response.each do |instance|
# #     instance.each do |k, v|
# #       puts "#{k}: #{v}"
# #     end
# #   end
# # end



# # def brew_from_open
# #   puts "What brewery would you like to find?"
# #   brew_in = gets.chomp.downcase.gsub(/\s+/, "_") # Gets, downcases and removes space in user input, joins with underscore
# #   link = 'https://api.openbrewerydb.org/breweries?by_name=' + brew_in # Concatenates user input brewery to end link
# #   response = HTTParty.get(link)
# #   # binding.pry

# #   if response.length > 1
# #     puts response
# #   else
# #     puts "Sorry, no information found."
# #   end
# # end

# # brew_from_open
  #   @states.each do |key, value|
  #     if @input == value
  #       @input = key
  #     end
  #   end

  # if brew_input == 'next'
    #   BreweryAPI.next_page
    # end

    if @user_choice == 'list'
      BreweryAPI.brewery_by_state(@user_choice)
      list_brewery_names
    elsif @user_choice == 'find'
      BreweryAPI.brewery_by_name(@user_choice)
      list_brewery_by_name
      Brewery.all.clear
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


  # if list_options == 'next'
      #   next_page
      # end

  # def next_page
  #   @page_num = 2  
  #   BreweryAPI.brewery_by_state(@input + '&page=' + @page_num.to_s) # Concatenates the user input with page string and page number.
  #   list_brewery_names
  # end
