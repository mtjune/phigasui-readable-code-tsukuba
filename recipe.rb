#! /usr/bin/env ruby
# coding: utf-8

# file_name = ARGV.length > 0 ? ARGV[0] : "recipe-data.txt"

user_num = ARGV.length / 2

# ユーザ名とファイルを読み込み
users = Hash.new
user_count = 0
recipe_count = 0
while user_count < user_num
  user_name = ARGV[user_count * 2]
  file_name = ARGV[user_count * 2 + 1]

  users[user_name] = Hash.new

  File.open(file_name, "r") do |recipe_data|

    recipe_data.readlines.each do |recipe_content|
      users[user_name][recipe_count] = recipe_content
      recipe_count += 1
    end

  end

  user_count += 1
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
  users.each do |user_name, recipes|
    puts "ユーザ名: #{user_name}"
    recipes.each do |recipe_id, recipe_content|
      puts "#{recipe_id}: #{recipe_content}"
    end
    puts "\n"
  end

else  # ID指定がある場合
  selected_id = ARGV[user_num * 2].to_i
  users.each do |user_name, recipes|
    puts "ユーザ名: #{user_name}"
    recipes.each do |recipe_id, recipe_content|
      puts "#{recipe_id}: #{recipe_content}" if selected_id == recipe_id
    end
    puts "\n"
  end
end
