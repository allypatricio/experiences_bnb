# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)

# Creating users

test_user = User.new({
  email: "test@test.com",
  password: "123456",
  password_confirmation: "123456",
  first_name: "Firstnametest",
  last_name: "Lastnametest",
  phone: "911"
})
test_user.save!

4.times do
  user = User.new({
    email: Faker::Internet.unique.email,
    password: "123456",
    password_confirmation: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.unique.phone_number
    })
  user.save!
end

p "Created 5 users: test@test.com and 4 random e-mail addresses. All users have password 123456"

# Create experiences

ADDRESSES = ["Cais do Sodre, Lisbon, Portugal", "Cascais, Portugal", "Sintra, Portugal", "Porto, Portugal", "Sagres, Portugal", "Faro, Portugal", "Serra d'Estrella, Portugal", "Costa da Caparica, Portugal", "Setubal, Portugal", "Carcavelos, Portugal"]
PHOTO_URLS = [
  "http://dqndusk8a84ol.cloudfront.net/image/53ad79112b255e943e1e2a842d685952.jpg?&x=1500&y=460&cx=0&cy=41&cw=3000&ch=919&icq=74&sig=388af7b42cab78324ee328ab7943a38e",
  "https://assets.entrepreneur.com/content/3x2/1300/20150608231057-surfing-water-waves.jpeg",
  "http://tamarazidar.com/wp-content/uploads/2015/09/TamaraZidar_RawFoodWorkshop8-940x627.jpg",
  "http://www.insidelisbon.com/wp-content/uploads/2017/08/IMG-20170727-WA0004_1300_2.jpg"]

20.times do
  experience = Experience.new({
    address: ADDRESSES.sample,
    title: Faker::Lorem.word,
    description: Faker::Lorem.words(rand(10..60)).join(" "),
    price: rand(5..30),
    duration: rand(1..5),
    category: Experience::CATEGORIES.sample,
    user_id: rand(1..4)
    })
  experience.remote_photo_url = PHOTO_URLS.sample
  experience.save
end

p "Created 20 experiences. Users 1-4 are hosts and have experiences assigned to them randomly. User 5 is not a host"

40.times do
  booking = Booking.new({
    user_id: rand(1..5),
    experience_id: rand(1..20),
    date_time: Faker::Time.forward(40, :all)
    })
  booking.save
end

p "Created 40 bookings. Bookings are randomly assigned to all users (which means that a host may have booked his own experience)"

