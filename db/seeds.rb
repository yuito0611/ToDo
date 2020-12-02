# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name:       "admin",
  full_name:  "administrator",
  email:      "admin@gmail.com",
  birthday:   Date.new(2000,5,10),
  sex:        1,
  administrator:  true,
  password:   "password",
  password_confirmation: "password"   
)
User.create(
  name:       "person1",
  full_name:  "Person1",
  email:      "p1@gmail.com",
  birthday:   Date.new(2000,5,10),
  sex:        2,
  administrator:  false,
  password:   "password",
  password_confirmation: "password"   
)


Category.create(
  name:  "習慣"
)

# Task.create(
#   name:  "ex1",
#   priority: 1,
#   done: false,
#   date: Date.current,
#   category_id: 1
# )
