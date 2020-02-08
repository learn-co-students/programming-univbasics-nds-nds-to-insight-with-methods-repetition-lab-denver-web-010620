$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source) #input is an array
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result #output is a hash: (:name => gross)
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source) #expected input is an array of hashes
#this method extracts a list of directors and puts them in an array
  a=[]
  i=0
  while i < source.length do
    a[i] = source[i][:name]
    i += 1
  end
  return a #return a simple array [x] - director name
end

def total_gross(source)
  names = list_of_directors(source) #array
  h = directors_totals(source) #hash
  
  grand_total = 0
  i=0
  while i < names.length do
    grand_total += h[names[i]]
    i+=1
  end
  return grand_total
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end

