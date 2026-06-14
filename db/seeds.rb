# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Users
creator = User.create!(name: "Creator User", email: "creator@test.com")
editor1 = User.create!(name: "Editor One", email: "editor1@test.com")
editor2 = User.create!(name: "Editor Two", email: "editor2@test.com")

# Posts (Creator 1:M Posts)
post1 = Post.create!(title: "First Post", body: "Content 1", user: creator, creator: creator)
post2 = Post.create!(title: "Second Post", body: "Content 2", user: creator, creator: creator)

# Many-to-Many (Editors)
post1.editors << editor1
post1.editors << editor2

post2.editors << editor1

puts "Seeding completed successfully!"
puts "Users: #{User.count}"
puts "Posts: #{Post.count}"