require "rubygems"
require "bundler/setup"

require "active_resource"

class Heatspot < ActiveResource::Base
  self.site = "http://heatspots.heroku.com/"
  
  # Plots a new heatspot on the server
  def self.plot(lat, long, strength)
    Heatspot.new(:lat => lat, :long => long, :strength => strength).save
  end
  
  # Removes all existing heatspots from the server
  def self.clear
    Heatspot.all.map(&:destroy)
  end
end