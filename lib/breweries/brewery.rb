class Brewery
  attr_reader :name, :brewery_type, :city, :state, :website_url, :street
  @@all = []

  def initialize(api_hash)
    apple = "apple"
    @name = api_hash["name"]
    @brewery_type = api_hash["brewery_type"]
    @city = api_hash["city"]
    @state = api_hash["state"]
    @website_url = api_hash["website_url"]
    @street = api_hash["street"]
    @@all << self
  end

  def self.all # Brewery.all class method
    @@all
  end
  
end
