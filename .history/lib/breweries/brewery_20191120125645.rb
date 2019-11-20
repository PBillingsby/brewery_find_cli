class Brewery
  
  @@all = []

  def initialize(api_hash)
    @name = api_hash["name"]
    @brewery_type = api_hash["brewery_type"]
    @city = api_hash["city"]
    @state = api_hash["state"]
    @website_url = api_hash["website_url"]
    @@all << self
  end

end