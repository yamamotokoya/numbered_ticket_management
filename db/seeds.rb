# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "管理者", email: "koya@gmail.com", password: "koya1985", password_confirmation: "koya1985",admin: true)
viewing_time = ViewingTime.create(hold_at: Date.current, program_name:"09:30", capacity: 250)

(1..100).each do |i|
   user = User.create(
    name: "ユーザー#{i}",
    email: "user-#{i}@gmail.com",
    password: "password#{i}",
    password_confirmation: "password#{i}"
  )
  user.reserved(viewing_time)
end

