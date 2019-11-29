require 'pry'
class BreweryAPI
  
  def self.brewery_by_state(user_input)
    brew_input = user_input.downcase.gsub(/\s+/, "_") # Gets, downcases and removes space in user input
    brew_link = 'https://api.openbrewerydb.org/breweries?by_state=' + brew_input # Concatenates user input brewery to end link
    response = HTTParty.get(brew_link)
    response.each do |hash|
      Brewery.new(hash)
    end
    response
  end

  def self.brewery_by_name(name_input)
    brew_name_input = name_input.gsub(/\s+/, "_")
    name_link = 'https://api.openbrewerydb.org/breweries?by_name=' + brew_name_input
    name_response = HTTParty.get(name_link)
    name_response.each do |hash|
      Brewery.new(hash)
    end
    name_response
  end

  def self.brewery_by_city(city_input)
    brew_city_input = city_input.gsub(/\s+/, "_")
    city_link = 'https://api.openbrewerydb.org/breweries?by_city=' + brew_city_input
    city_response = HTTParty.get(city_link)
    city_response.each do |hash|
      Brewery.new(hash)
    end
    city_response
  end
  # POSSIBLE CLASS METHOD FOR SHOWING 20 MORE BREWERY RESULTS.
  # def self.next_page
  #   page_number = 1
  #   new_page = '&page=' + page_number
  #   next_page = 'https://api.openbrewerydb.org/breweries?by_name=' + @brew_name_input #+ new_page.to_s
  #   next_response = HTTParty.get(name_link)
  # end
end