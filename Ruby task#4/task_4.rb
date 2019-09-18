class Country
  def initialize(continent, name, population, inflation)
    @continent = continent
    @name = name
    @population = population
    @inflation = inflation
  end

  def get_continent
    @continent
  end

  def get_name
    @name
  end

  def get_population
    @population.to_i
  end

  def get_inflation
    @inflation.to_i
  end
end

class Continent
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end
end

class World
  def initialize()
    @continents = []
    @countries = []
  end

  def add_continent(continent)
    @continents << continent
  end

  def add_country(country)
    @countries << country
  end

  def get_continents
    @continents
  end

  def get_counties
    @countries
  end
end

require "rexml/document"
include REXML
doc = Document.new File.new("cia-1996.xml")
world = World.new
doc.elements.each("cia/continent") do |element|
  continent = Continent.new(element.attributes["name"])
  world.add_continent(continent)
end
doc.elements.each("cia/country") do |element|
  country = Country.new(element.attributes["continent"],
     element.attributes["name"], element.attributes["population"],
     element.attributes["inflation"])
  world.add_country(country)
end

puts "The biggest population is in:"
puts world.get_counties.max_by {|elem| elem.get_population }.get_name
puts "The top-5 biggest inflation:"
world.get_counties.max(5) {|elem1,elem2| elem1.get_inflation <=> elem2.get_inflation }.
each_with_index do |elem, index|
  puts "№#{index + 1}: is #{elem.get_name}, his inflation #{elem.get_inflation}"
end

continent_hash = Hash.new { |hash, key| hash[key] = []  }
sorted_continent = world.get_continents.sort {|a, b| a.get_name <=> b.get_name}
sorted_continent.each {|elem| continent_hash[elem.get_name]}
world.get_counties.each do |elem|
  continent_hash[elem.get_continent] << elem
end
continent_hash.each {|key, arr| continent_hash[key] = arr.sort do |a, b|
    a.get_name <=> b.get_name
  end
}
continent_hash.each do |key, arr|
  puts "Continent #{key}:"
  arr.each_with_index { |elem, index| puts "  #{index + 1}: #{elem.get_name}" }
end
