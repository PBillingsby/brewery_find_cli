class Brewery
  attr_reader :name, :brewery_type, :city, :state, :website_url, :street
  @@all = []

  def initialize(api_hash)
    @name = api_hash["name"]
    @brewery_type = api_hash["brewery_type"]
    @city = api_hash["city"]
    @state = api_hash["state"]
    @website_url = api_hash["website_url"]
    @street = api_hash["street"]
    @@all << self
  end

  def self.all
    @@all
  end

  # def self.clear_all
  #   @@all.clear
  # end
  
end
@@states = ["alaska", # Changed states to match @input and remove one line of code
  "alabama",
  "arkansas",
  "arizona",
  "california",
  "colorado",
  "connecticut",
  "district_of_columbia",
  "delaware",
  "florida",
  "georgia",
  "guam",
  "hawaii",
  "iowa",
  "idaho",
  "illinois",
  "indiana",
  "kansas",
  "kentucky",
  "louisiana",
  "massachusetts",
  "maryland",
  "maine",
  "michigan",
  "minnesota",
  "missouri",
  "mississippi",
  "montana",
  "north_carolina",
  "north_dakota",
  "nebraska",
  "new_hampshire",
  "new_jersey",
  "new_mexico",
  "nevada",
  "new_york",
  "ohio",
  "oklahoma",
  "oregon",
  "pennsylvania",
  "puerto_rico",
  "rhode_island",
  "south_carolina",
  "south_dakota",
  "tennessee",
  "texas",
  "utah",
  "virginia",
  "vermont",
  "washington",
  "wisconsin",
  "west_virginia",
  "wyoming"]