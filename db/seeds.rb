#encoding: utf-8 
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

Category.create(name: 'Movies')
Product.create(title: 'Hobbit: Pustkowie Smauga', description: 'Druga część filmowego arcydzieła w reżyserii Petera Jacksona.', price: '42.49', category_id: 1, user_id: 2)
Product.create(title: 'Grawitacja', description: 'Grawitacja to niezwykłe, wręcz kosmiczne widowisko, trzymające w napięciu od pierwszej do ostatniej minuty.', price: '35.99', category_id: 1, user_id: 3)
Product.create(title: 'Wilk z Wall Street', description: 'Jordan Belfort był złotym dzieckiem świata amerykańskich finansów. Szybki i oszałamiający sukces przyniósł mu fortunę, władzę i poczucie bezkarności.', price: '27.99', category_id: 1, user_id: 4)
Review.create(content: 'Fajny ale troche za dlugi', rating: 4, product_id: 1, user_id: 3)
Review.create(content: 'Bardzo dobry', rating: 5, product_id: 2, user_id: 4)
Review.create(content: 'Dobre kino', rating: 3, product_id: 3, user_id: 5)

puts "seed ok"