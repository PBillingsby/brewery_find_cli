class BreweryAPI
  # def self.brew_by_state(state)
  #   brew_state = 'https://api.openbrewerydb.org/breweries?by_state=new_york'
  #   state_response = HTTParty.get(brew_by_state)
  #   state_formatted = state_response.each do |brew_obj|
  #     brew_obj.each {|k_obj, v_obj| puts "#{k_obj}: #{v_obj}"}
  #   end
  #   state_formatted
  # end
  
  def self.brewery_by_state(user_input)
    brew_input = user_input.downcase.gsub(/\s+/, "_") # Gets, downcases and removes space in user input
    brew_link = 'https://api.openbrewerydb.org/breweries?by_state=' + brew_input # Concatenates user input brewery to end link
    response = HTTParty.get(brew_link)
    # binding.pry
    response.each do |hash|
      Brewery.new(hash)
    end
    response
  end

  def self.brewery_by_name(name_input)
    brew_name_input = name_input.downcase.gsub(/\s+/, "_")
    name_link = 'https://api.openbrewerydb.org/breweries?by_name=' + brew_name_input
    name_response = HTTParty.get(name_link)
    name_response.each do |hash|
      Brewery.new(hash)
    end
    name_response
  end
end