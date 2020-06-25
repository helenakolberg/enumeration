class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names()
    @planets.map {|planet| planet.name}
  end

  def get_planet_by_name(planet_name)
    @planets.find do |planet|
      planet.name == planet_name
    end
  end


  def get_largest_planet
    @planets.max_by {|planet| planet.diameter}
  end

  def get_smallest_planet
    @planets.min_by { |planet| planet.diameter}
  end

  def get_planets_with_no_moons
    @planets.find_all { |planet| planet.number_of_moons == 0 }
  end

  def get_planets_with_more_moons(number)
    moon_planets = @planets.find_all { |planet| planet.number_of_moons > number}
    return moon_planets.map { |planet| planet.name }
  end

  def get_number_of_planets_closer_than(distance)
    return @planets.count {|planet| planet.distance_from_sun < distance}
  end

  def get_total_number_of_moons
    @planets.reduce(0) {|total, planet| total + planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    planets_by_distance = @planets.sort_by { |planet| planet.distance_from_sun }
    return planets_by_distance.map { |planet| planet.name }
  end


    
end
