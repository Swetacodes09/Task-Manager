# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

require 'faker'

# Create 20 tasks
20.times do
  Task.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    status: Task.statuses.keys.sample, 
    deadline: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    user_id: User.pluck(:id).sample 
  )
end

puts "20 tasks created successfully!"
