require 'httparty' # Load order
require 'pry'
require_relative "breweries/version"
require_relative "breweries/cli"
require_relative "breweries/brewery_api"
require_relative "breweries/brewery"

module Breweries
  class Error < StandardError; end #Add code
  # Your code goes here...
end
