# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Question.destroy_all
Poll.destroy_all
AnswerChoice.destroy_all
Response.destroy_all


user1 = User.create(user_name: "andrew")
user2 = User.create(user_name: "Virginia")
user3 = User.create(user_name: "Dallas")

poll1 = Poll.create(title: 'Food Poll', user_id: user3.id)
poll2 = Poll.create(title: "Name Poll", user_id: user2.id)

q1 = Question.create(question: "What do you eat for breakfast?", poll_id: poll1.id)
q2 = Question.create(question: "What food do you hate?", poll_id: poll1.id)
q3 = Question.create(question: "What is your name?", poll_id: poll2.id)

ac1 = AnswerChoice.create(answer: "cereal", question_id: q1.id)
ac2 = AnswerChoice.create(answer: "nothing", question_id: q1.id)
ac3 = AnswerChoice.create(answer: "bananas", question_id: q1.id)

ac4 = AnswerChoice.create(answer: "cookies", question_id: q2.id)
ac5 = AnswerChoice.create(answer: "spinach", question_id: q2.id)
ac6 = AnswerChoice.create(answer: "Andrew", question_id: q3.id)

r1 = Response.create(answer_choice_id: ac1.id, user_id: user1.id)
r2 = Response.create(answer_choice_id: ac3.id, user_id: user2.id)
r3 = Response.create(answer_choice_id: ac4.id, user_id: user1.id)
r4 = Response.create(answer_choice_id: ac6.id, user_id: user1.id)
