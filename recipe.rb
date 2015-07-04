#! /usr/bin/env ruby
# coding: utf-8

# file_name = ARGV.length > 0 ? ARGV[0] : "recipe-data.txt"

user_num = ARGV.length / 2

# ユーザ名とファイルを読み込み
users = Array.new
recipes = Array.new

user_id = 0
recipe_id = 0
while user_id < user_num
  user_name = ARGV[user_id * 2]
  file_name = ARGV[user_id * 2 + 1]

  user = {"name" => user_name, "id" => user_id}
  users.push(user)

  File.open(file_name, "r") do |recipe_data|

    recipe_data.readlines.each do |recipe_content|
      (recipe_name, recipe_description) = recipe_content.split(" ")
      recipe = {"name" => recipe_name, "description" => recipe_description, "id" => recipe_id, "user_id" => user_id}
      recipes.push(recipe)
      recipe_id += 1
    end

  end

  user_id += 1
end


# if ARGV.length > 1
#   input_id = ARGV[1]
# else
#   puts "./recipe.rb [filename] [recipe_id]"
#   exit()
# end

# recipes = Hash.new
# File.open(file_name, "r") do |recipe_data|
#
#   recipe_data.readlines.each_with_index do |recipe, recipe_id|
#     recipes[recipe_id] = recipe
#     # puts "#{recipe_id}: #{recipes[recipe_id]}"
#   end
#
#   # puts "#{input_id}: #{recipes[input_id]}"
#
# end


# 表示
if ARGV.length % 2 == 0 # ID指定が無い場合
  users.each do |user_hash|
    puts "ユーザ名: #{user_hash["id"]}: #{user_hash["name"]}"
    recipes.each do |recipe_hash|
      if user_hash["id"] == recipe_hash["user_id"]
        puts "#{recipe_hash["id"]}: #{recipe_hash["name"]} #{recipe_hash["description"]}"
      end
    end
    puts "\n"
  end

else  # ID指定がある場合
  selected_id = ARGV[user_num * 2].to_i
  users.each do |user_hash|
    puts "ユーザ名: #{user_hash["id"]}: #{user_hash["name"]}"
    recipes.each do |recipe_hash|
      if user_hash["id"] == recipe_hash["user_id"] and selected_id == recipe_hash["id"]
        puts "#{recipe_hash["id"]}: #{recipe_hash["name"]} #{recipe_hash["description"]}"
      end
    end
    puts "\n"
  end
end
