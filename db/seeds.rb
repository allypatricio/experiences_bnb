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
  "https://images.unsplash.com/photo-1519789110007-0e751882be76?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ffcb4d8d9dff9ef47b3330b7fa63b162&auto=format&fit=crop&w=1458&q=80",
  "https://images.unsplash.com/photo-1516710089018-96725b621d01?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ca99f5235ffb5ba1ea95cc3b635d44cf&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b5ecaef0464fc50a866e74a6176c3fdc&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1493807742375-fbc46d996e8f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6f0038573a81b1169576b6674a3ce202&auto=format&fit=crop&w=1552&q=80"]

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

