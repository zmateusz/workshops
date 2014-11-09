#encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(
    firstname: "John",
    lastname: "Doe",
    email: "admin@example.com",
    password: "12341234",
    password_confirmation: "12341234",
    admin: true
)
u.save!

firstnames=['Sadie','Gussie','Liam','Edwyn','Kendall']
lastnames=['Acker','Donalds','Edgar','Street','Thorne']
(1..5).each do |i|
  u = User.new(
      firstname: firstnames[i-1],
      lastname: lastnames[i-1],
      email: "user#{i}@example.com",
      password: "12341234",
      password_confirmation: "12341234"
  )
  u.save!
end

Category.create(name: 'Movies')

Product.create(title: 'Maleficent', description: "Explore the untold story of Disney's most iconic villain in this wickedly fun twist on the classic SLEEPING BEAUTY.",
              price: '42.49', category_id: 1, user_id: 2)
Product.create(title: 'Godzilla', description: "In this gritty, realistic sci-fi action epic, Godzilla returns to its roots as one of the world's most recognized monsters.",
              price: '35.99', category_id: 1, user_id: 3)
Product.create(title: 'Guardians of the Galaxy', description: "From Marvel, the studio that brought you the global blockbuster franchises of Iron Man, Thor, Captain America and The Avengers, comes a new team—the Guardians of the Galaxy.",
              price: '44.99', category_id: 1, user_id: 4)

Review.create(content: "Obviously I liked the film", rating: 5, product_id: 1, user_id: 2)
Review.create(content: "Pretty good, but a wasted opportunity", rating: 3, product_id: 1, user_id: 3)
Review.create(content: "This Godzilla will hold your attention from start to finish!", rating: 4, product_id: 2, user_id: 4)
Review.create(content: "It's a fun movie and worth a watch", rating: 5, product_id: 3, user_id: 2)
Review.create(content: "Must See Flick!", rating: 5, product_id: 3, user_id: 3)
Review.create(content: "Big, fun summer movie", rating: 4, product_id: 3, user_id: 4)

Review.create(content: "Good movie for long-time Godzilla fan & spouse.", rating: 5, product_id: 2, user_id: 1)
Review.create(content: "Better than the 1998 remake, this is a return-to-form for the Godzilla...", rating: 5, product_id: 2, user_id: 1)
Review.create(content: "Not bad", rating: 3, product_id: 2, user_id: 1)
Review.create(content: "This was ridiculous and I'm still kicking myself for buying ...", rating: 3, product_id: 2, user_id: 1)
Review.create(content: "Not bad, but just lacking something.", rating: 3, product_id: 2, user_id: 1)
Review.create(content: "I am so torn over this movie.", rating: 4, product_id: 2, user_id: 1)
Review.create(content: "I liked this film but I thought it could have been better!", rating: 4, product_id: 2, user_id: 1)

puts "seed ok"