require 'pry'
class BreweryAPI
  
  def self.brewery_by_state(user_input) # Browse breweries by US states.
    # brew_input = user_input.downcase.gsub(/\s+/, "_") # Gets, downcases and removes space in user input
    brew_link = 'https://api.openbrewerydb.org/breweries?by_state=' + brew_input # Concatenates user input brewery to end link
    response = HTTParty.get(brew_link)
    response.each do |hash|
      Brewery.new(hash)
    end
    response
  end

  def self.brewery_by_name(name_input) # Browse breweries by name
    brew_name_input = name_input.gsub(/\s+/, "_") # Input whitespace connected by underscore to format URL
    name_link = 'https://api.openbrewerydb.org/breweries?by_name=' + brew_name_input
    name_response = HTTParty.get(name_link)
    name_response.each do |hash|
      Brewery.new(hash)
    end
    name_response
  end
end