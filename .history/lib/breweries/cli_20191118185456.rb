require 'httparty'
require 'pry'
# puts "Please enter a state: "
# user_input = gets.chomp

brew_by_state = 'https://api.openbrewerydb.org/breweries?by_state=new_york'
state_response = HTTParty.get(brew_by_state)
state_formatted = state_response.each do |brew_obj|
  brew_obj.each {|k_obj, v_obj| puts "#{k_obj}: #{v_obj}"}
end

# brew_by_name = 'https://api.openbrewerydb.org/breweries?by_name=tired_hands' #Going through individual breweries and displaying key and value.
# response = HTTParty.get(brew_by_name)
# formatted = response.each do |k|
#   k.each do |k, v|
#     puts "#{k}: #{v}"
#   end
# end

state_formatted