$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'


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
    #binding.pry

def list_of_directors(source)
  #binding.pry
   
    index = 0
    director_list = []
      
     
     while index < source.length do
       director_list.push(source[index][:name])
         index += 1
    end
      director_list
  end

def total_gross(source)
   
     index = 0 
       mass_total =  0
        lod = list_of_directors(source) 
         lodgt = directors_totals(source)
      while index < lod.length do
    
        mass_total += lodgt[lod[index]]
       
      
      index += 1
       
     end
    mass_total      
  
end


