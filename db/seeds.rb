user = User.create(name: "admin", email: "example@mail.ru", password: "123456")

50.times do
  title = Faker::FunnyName.two_word_name
  content = Faker::Lorem.paragraph(sentence_count: 10, supplemental: true)
  Post.create(title:, content:, user_id: user.id)
end


