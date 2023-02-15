50.times do
  title = Faker::FunnyName.two_word_name
  content = Faker::Lorem.paragraph(sentence_count: 10, supplemental: true)
  Post.create(title:, content:)
end


