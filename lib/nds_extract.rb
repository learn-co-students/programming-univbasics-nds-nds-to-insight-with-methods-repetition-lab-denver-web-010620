$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'

def directors_totals(source)
  #returns hash of {"Director Name" => gross_for_director}
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  #returns gross for a given director
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  #returns array of "directors"
  directors = []

  # Write this implementation
  for i in 0...source.length
    directors[i] = source[i][:name]
  end

  return directors
end

def total_gross(source)
  total_gross_all = 0
  directors = list_of_directors(source)
  director = ""
  totals = directors_totals(source)

  for i in 0...directors.count
    director = directors[i]
    total_gross_all = total_gross_all + totals[director]
  end

  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  return total_gross_all
end
