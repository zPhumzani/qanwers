# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all
user = User.first
Category.create(user_id: user.id, name: "Gaming")
Category.create(user_id: user.id, name: "Programming")
Category.create(user_id: user.id, name: "Life")
Category.create(user_id: user.id, name: "Music & Artist")
Category.create(user_id: user.id, name: "Books")
Category.create(user_id: user.id, name: "Technology")
Category.create(user_id: user.id, name: "Sport")
Category.create(user_id: user.id, name: "Movies ")
Category.create(user_id: user.id, name: "History")
Category.create(user_id: user.id, name: "Science")
Category.create(user_id: user.id, name: "World Events")
Category.create(user_id: user.id, name: "Inspiration")
Category.create(user_id: user.id, name: "Places")
Category.create(user_id: user.id, name: "Internet")
Category.create(user_id: user.id, name: "Real State")