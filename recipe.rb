#! /usr/bin/env ruby
# coding: utf-8

file_name = ARGV.length > 0 ? ARGV[0] : "recipe-data.txt"

File.open(file_name, "r") do |recipe_data|
  recipe_title = recipe_data.gets
  puts recipe_title
end
