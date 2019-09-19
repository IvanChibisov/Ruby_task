class Country
  attr_reader :name
  attr_reader :continent
  attr_reader :population
  attr_reader :inflation
  def initialize(continent, name, population, inflation)
    @continent = continent
    @name = name
    @population = population.to_i
    @inflation = inflation.to_i
  end
end

class Continent
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class World
  attr_reader :countries
  attr_reader :continents
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
end

require "rexml/document"
include REXML
doc = Document.new File.new('cia-1996.xml')
world = World.new
doc.elements.each('cia/continent') do |element|
  continent = Continent.new(element.attributes['name'])
  world.add_continent(continent)
end
doc.elements.each('cia/country') do |element|
  country = Country.new(element.attributes['continent'],
     element.attributes['name'], element.attributes['population'],
     element.attributes['inflation'])
  world.add_country(country)
end

puts 'The biggest population is in:'
puts world.countries.max_by {|elem| elem.population }.name
puts 'The top-5 biggest inflation:'
world.countries.max(5) {|elem1,elem2| elem1.inflation <=> elem2.inflation }.
each_with_index do |elem, index|
  puts "№#{index + 1}: is #{elem.name}, his inflation #{elem.inflation}"
end

sorted_continent = world.continents.sort {|a, b| a.name <=> b.name}
sorted_countries = world.countries.sort {|a, b| a.name <=> b.name}
sorted_continent.each do |continent|
  puts "Continent #{continent.name}:"
  i = 1
  sorted_countries.each do |country|
    if country.continent == continent.name
      puts "  #{i}. #{country.name}"
      i += 1
    end
  end
end
