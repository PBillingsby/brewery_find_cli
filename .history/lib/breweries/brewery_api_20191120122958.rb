class BreweryAPI
  def self.brew_by_state
    brew_state = 'https://api.openbrewerydb.org/breweries?by_state=new_york'
    state_response = HTTParty.get(brew_by_state)
    state_formatted = state_response.each do |brew_obj|
      brew_obj.each {|k_obj, v_obj| puts "#{k_obj}: #{v_obj}"}
    end
    state_formatted
  end
  
  def self.brew
    puts "What brewery would you like to find?"
    brew_input = gets.chomp.downcase.gsub(/\s+/, "") # Gets, downcases and removes space in user input
    brew_link = 'http://prost.herokuapp.com/api/v1/brewery/' + brew_input # Concatenates user input brewery to end link
    response = HTTParty.get(brew_link)
    response.each do |k, v|
      puts "#{k} is #{v}"
    end
    puts response
  end
end