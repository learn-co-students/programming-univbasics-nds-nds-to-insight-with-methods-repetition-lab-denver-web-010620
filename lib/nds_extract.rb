$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
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
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  p source.map {|x| x.values[0]}
  # Write this implementation
end

def total_gross(source) 
grand_total = 0
row_index = 0
while row_index < source.length do
  column_index = 0
  while column_index < source[row_index].length do
    inner_len = source[row_index][column_index].length
    inner_index = 0
    while inner_index < inner_len do
      grand_total += source[row_index][column_index][inner_index][:price]
      inner_index += 1
    end
    column_index += 1
  end
  row_index += 1
end


