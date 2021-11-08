# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Event.destroy_all
Attendance.destroy_all

User.create(first_name:"Paul", last_name:"Predo", email:"paulpredo666@yopmail.com", description:"Sample User")
User.create(first_name:"Louis", last_name:"Predo", email:"louispredo666@yopmail.com", description:"Sample User")
User.create(first_name:"Pierre", last_name:"Predo", email:"pierrepredo666@yopmail.com", description:"Sample User")
User.create(first_name:"Henri", last_name:"Predo", email:"henripredo666@yopmail.com", description:"Sample User")


10.times do |i|
  Event.create(start_date:Time.now+(rand(10)*60), duration:20, title: "Concert #{i} ", description: "Super concert blablablabla", price:20, location:"Salle des fêtes", user:User.all.sample)
end

Attendance.create(user:User.first, event:Event.first)
Attendance.create(user:User.last, event:Event.first)

Attendance.create(user:User.first, event:Event.last)
Attendance.create(user:User.last, event:Event.last)