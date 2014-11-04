# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(
    firstname: "admin",
    lastname: "minda",
    email: "admin@example.com",
    password: "12341234",
    password_confirmation: "12341234",
    admin: true
)
u.save!

(1..5).each do |i|
  u = User.new(
      firstname: "first#{i}",
      lastname: "last#{i}",
      email: "user#{i}@example.com",
      password: "12341234",
      password_confirmation: "12341234"
  )
  u.save!

end