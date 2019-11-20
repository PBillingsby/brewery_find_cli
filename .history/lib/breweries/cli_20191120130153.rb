class CLI

  def start
    puts "Welcome...."
    puts "Type in a state to list breweries: "
    @input = gets.strip.downcase
    BreweryAPI.brewery_by_state(@input)
  end
end
