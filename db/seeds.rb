# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# john = User.create!(email: 'john@example.com',password: 'password')
# emily = User.create!(email: 'emily@example.com',password: 'password')

john = User.find_by(email: 'john@example.com')
emily = User.find_by(email: 'emily@example.com')

john.boards.create!(
    name: 'test1',
    description: 'test投稿-1',
)

emily.boards.create!(
    name: 'test2',
    description: 'test投稿-2',
)
