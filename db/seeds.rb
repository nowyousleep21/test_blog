user = User.create(name: "John Doe", email: "example@mail.ru", password: "123456")
20.times do
  title = Faker::FunnyName.two_word_name
  content = Faker::Lorem.paragraph(sentence_count: 10, supplemental: true)
  post = Post.create(title:, content:, user_id: user.id)
  3.times do
    comment_params = { body: Faker::FunnyName.three_word_name, user_id: user.id, post_id: post.id }
    post.comments.build(comment_params).save
  end
end


AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456') if Rails.env.development?
