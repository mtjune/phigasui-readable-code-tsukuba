#! /usr/bin/env ruby
# coding: utf-8

file_name = ARGV.length > 0 ? ARGV[0] : "recipe-data.txt"
# if ARGV.length > 1
#   input_id = ARGV[1]
# else
#   puts "./recipe.rb [filename] [recipe_id]"
#   exit()
# end

recipes = {}
File.open(file_name, "r") do |recipe_data|

  recipe_data.readlines.each_with_index do |recipe, recipe_id|
    recipes[recipe_id] = recipe
    puts "#{recipe_id}: #{recipes[recipe_id]}"
  end

    # puts "#{input_id}: #{recipes[input_id]}"

end
