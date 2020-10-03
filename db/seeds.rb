# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ----------------------------------- POST ----------------------------------- #

Post.destroy_all

p1 = Post.create!(
  image: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2020%2F01%2Fli-ning-way-of-wade-8-team-no-sleep-release-date-info-4.jpg?q=90&w=1400&cbr=1&fit=max",
  description: "WoW 8 No-sleep!",
  brand: "Li-Ning"
)

p2 = Post.create!(
  image: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2018%2F07%2Fli-ning-dwayne-wade-lifetime-partnership-shoe-0-1.jpg?q=90&w=1400&cbr=1&fit=max",
  description: 'The latest "Way of Wade" sneaker is here.',
  brand: "Li-Ning"
)

p3 = Post.create!(
  image: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2012%2F12%2Fthe-air-jordan-xx8-takes-flight-1.jpg?q=90&w=1400&cbr=1&fit=max",
  description: "The latest “Way of Wade” sneaker is here.",
  brand: "Air Jordan"
)

p4 = Post.create!(
  image: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2020%2F08%2Fnike-time-to-vote-us-elections-partnership-0001.jpg?q=90&w=1400&cbr=1&fit=max",
  description: "Air Mag - Return to the Future",
  brand: "Li-Ning"
)

p5 = Post.create!(
  image: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2014%2F04%2Fadidas-basketball-tmac-3-og-orlando-edition-1.jpg?q=90&w=1400&cbr=1&fit=max",
  description: "TMAC 3 OG Orlando",
  brand: "Adidas"
)

puts "Created #{Post.count} posts."

# ---------------------------------- COMMENT --------------------------------- #

Comment.destroy_all

c1 = Comment.create!(
  content: "Because of SNKRS, I wont have any shoes thats slightly hyped."
)
c2 = Comment.create!(
  content: "They about to ruin these with awful colorways like they did the 380."
)
c3 = Comment.create!(
  content: "I Like Em."
)
c4 = Comment.create!(
  content: "Not for me but i will say these are their best attempt at a basketball shoe in recent years."
)
c5 = Comment.create!(
  content: "Lets put some japanese text on em, them weebos finna go crazy over em."
)
c6 = Comment.create!(
  content: "These gonna be impossible to get lol."
)
c7 = Comment.create!(
  content: "I thought we got over the white yeezy customs two years ago."
)

puts "Created #{Comment.count} comments."

# ---------------------------------- USER --------------------------------- #

User.destroy_all

u1 = User.create!(
  email: "ryan@ga.co",
  password: "chicken",
  name: "Ryan"
)

u2 = User.create!(
  email: "luke@ga.co",
  password: "chicken",
  name: "Luke"
)

u3 = User.create!(
  email: "zara@ga.co",
  password: "chicken",
  name: "Zara"
)

u4 = User.create!(
  email: "kate@ga.co",
  password: "chicken",
  name: "Kate"
)

puts "Created #{User.count} users."

# -------------------------------- ASSOCIATION ------------------------------- #

u1.posts << p1 << p2
u2.posts << p3
u3.posts << p4
u4.posts << p5

p1.comments << c4 << c2 << c6
p2.comments << c5
p3.comments << c1
p4.comments << c3
p5.comments << c7

u1.comments << c1 << c3
u2.comments << c4 << c5
u3.comments << c6 << c7
u4.comments << c2