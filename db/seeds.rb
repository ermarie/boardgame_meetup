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
game1.users << user1 << user2 << user3 << user4
Play.create(minutes_played: 60, winner: "Me", user_id: 1, game_id: 1)
Play.create(minutes_played: 40, winner: "tie: Me and Nancy", user_id: 1, game_id: 1)
Play.create(minutes_played: 55, winner: "Joe", user_id: 3, game_id: 1)
Play.create(minutes_played: 60, winner: "Brian", user_id: 4, game_id: 1)
game2 = Game.create(name: "Pandemic", min_play_time: 45, max_play_time: 45, min_num_players: 2, max_num_players: 4, min_age: 8, max_age: 10)
game2.users << user1 << user3 << user4 << user6
Play.create(minutes_played: 60, winner: "tie: Joe and Brian", user_id: 1, game_id: 2)
Play.create(minutes_played: 60, winner: "Me", user_id: 4, game_id: 2)
Play.create(minutes_played: 60, winner: "Brian", user_id: 5, game_id: 2)
game3 = Game.create(name: "Concordia", min_play_time: 100, max_play_time: 100, min_num_players: 2, max_num_players: 5, min_age: 13, max_age: 100)
game3.users << user3 << user4
game4 = Game.create(name: "Puerto Rico", min_play_time: 90, max_play_time: 150, min_num_players: 2, max_num_players: 5, min_age:12, max_age: 100)
game4.users << user1 << user5 << user6
game5 = Game.create(name: "Power Grid", min_play_time: 120, max_play_time: 120, min_num_players: 2, max_num_players: 6, min_age:12, max_age: 100)
game5.users << user2 << user3 << user5 << user6
game6 = Game.create(name: "Tzolk'in: The Mayan Calendar", min_play_time: 90, max_play_time: 90, min_num_players: 2, max_num_players: 4, min_age:13, max_age: 100)
game7 = Game.create(name: "Azul", min_play_time: 30, max_play_time: 45, min_num_players: 2, max_num_players: 4, min_age: 8, max_age: 100)
game8 = Game.create(name: "Wingspan", min_play_time: 40, max_play_time: 70, min_num_players: 1, max_num_players: 5, min_age: 10, max_age: 100)
game9 = Game.create(name: "7 Wonders", min_play_time: 30, max_play_time: 30, min_num_players: 2, max_num_players: 7, min_age: 10, max_age: 10)
game10 = Game.create(name: "Race for the Galaxy", min_play_time: 30, max_play_time: 60, min_num_players: 2, max_num_players: 4, min_age: 12, max_age: 100)
game11 = Game.create(name: "Five Tribes", min_play_time: 40, max_play_time: 80, min_num_players: 2, max_num_players: 4, min_age: 13, max_age: 100)
game12 = Game.create(name: "Code Names", min_play_time: 15, max_play_time: 15, min_num_players: 2, max_num_players: 8, min_age: 14, max_age: 100)
game13 = Game.create(name: "Patchwork", min_play_time: 15, max_play_time: 30, min_num_players: 2, max_num_players: 2, min_age: 8, max_age: 100)
game14 = Game.create(name: "Dominion", min_play_time: 30, max_play_time: 30, min_num_players: 2, max_num_players: 4, min_age: 13, max_age: 100)
game15 = Game.create(name: "Stone Age", min_play_time: 60, max_play_time: 90, min_num_players: 2, max_num_players: 4, min_age: 10, max_age: 100)
