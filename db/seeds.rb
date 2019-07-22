# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(email: "erin@erin.com", name: "Erin", password: "erin", password_confirmation: "erin")
user2 = User.create(email: "nancy@nancy.com", name: "Nancy", password: "nancy", password_confirmation: "nancy")
user3 = User.create(email: "brian@brian.com", name: "Brian", password: "brian", password_confirmation: "brian")
user4 = User.create(email: "ursula@ursula.com", name: "Ursula", password: "ursula", password_confirmation: "ursula")
user5 = User.create(email: "maria@maria.com", name: "Maria", password: "maria", password_confirmation: "maria")
user6 = User.create(email: "adam@adam.com", name: "Adam", password: "adam", password_confirmation: "adam")

group1 = Group.create(name: "Group 1")
group2 = Group.create(name: "Group 2")
group3 = Group.create(name: "Group 3")

user1.groups << group1 << group2 << group3
user2.groups << group1 << group2
user3.groups << group1 << group2 << group3
user4.groups << group1
user5.groups << group2 << group3
user6.groups << group1 << group3

event1 = Event.create(name: "G1 Event 1", date_time: DateTime.new(2019,11,19,8,37,48,"-06:00"))
event2 = Event.create(name: "G1 Event 2", date_time: DateTime.new(2019,10,19,8,37,48,"-06:00"))
event3 = Event.create(name: "G1 Event 3", date_time: DateTime.new(2019,9,19,8,37,48,"-06:00"))
group1.events << event1 << event2 << event3
event4 = Event.create(name: "G2 Event 1", date_time: DateTime.new(2019,9,5,17,00,00,"-06:00"))
event5 = Event.create(name: "G2 Event 2", date_time: DateTime.new(2019,9,12,17,00,00,"-06:00"))
event6 = Event.create(name: "G2 Event 3", date_time: DateTime.new(2019,9,19,17,00,00,"-06:00"))
group2.events << event4 << event5 << event6
event7 = Event.create(name: "G3 Event 1", date_time: DateTime.new(2019,12,12,17,00,00,"-06:00"))
group3.events << event7

game1 = Game.create(name: "Settlers of Catan", min_play_time: 60, max_play_time: 60, min_num_players: 2, max_num_players: 4, min_age:10, max_age: 10)
