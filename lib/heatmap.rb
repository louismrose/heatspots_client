require "rubygems"
require "bundler/setup"

require "active_resource"

class Heatmap < ActiveResource::Base
  self.site = "http://localhost:3000/"
  
  # Plots on the server a new heatmap containing one heatspot
  # heatspot should be a hash of the the form:
  #   { lat: 1, long: 2, strength: 3 }
  def self.plot_singleton(name, heatspot)
    self.plot_many(name, [heatspot])
  end

  # Plots on the server a heatmap containing several heatspots
  # heatspots should be an array of hashes of the the form:
  #   [
  #     { lat: 1, long: 2, strength: 3 },
  #     { lat: 4, long: 5, strength: 6 }
  #   ]
  def self.plot_many(name, heatspots)
    heatmap = Heatmap.new(:name => name);
    heatmap.heatspots_attributes = heatspots
    heatmap.save
  end
end