# Web app that searches brewery and beers based on user input.
require 'httparty'
require 'pry'
# puts "Please enter a state: " TEST
# user_input = gets.chomp
# def brew_by_state
#   brew_state = 'https://api.openbrewerydb.org/breweries?by_state=new_york'
#   state_response = HTTParty.get(brew_by_state)
#   state_formatted = state_response.each do |brew_obj|
#     brew_obj.each {|k_obj, v_obj| puts "#{k_obj}: #{v_obj}"}
#   end
#   state_formatted
# end

# def brew_by_name
#   brew_name = 'https://api.openbrewerydb.org/breweries?by_name=tired_hands' #Going through individual breweries and displaying key and value.
#   response = HTTParty.get(brew_by_name)
#   formatted = response.each do |instance|
#     instance.each do |k, v|
#       puts "#{k}: #{v}"
#     end
#   end
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

def brew_from_open
  puts "What brewery would you like to find?"
  brew_in = gets.chomp.downcase.gsub(/\s+/, "_") # Gets, downcases and removes space in user input, joins with underscore
  link = 'https://api.openbrewerydb.org/breweries?by_name=' + brew_in # Concatenates user input brewery to end link
  response = HTTParty.get(link)
  if response == []
    nil
  else
    puts response
  end
end

brew_from_open