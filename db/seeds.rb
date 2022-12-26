# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(first_name: "John", last_name: "Doe", address: "123 Main St", phone_number: "123-456-7890", role: "admin")
category = Category.create(title: "Test Category", user_id: user.id)
post = Post.create(title: "Test Post", desc: "This is a test post", user_id: 1, category_id: 1)
