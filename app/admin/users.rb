ActiveAdmin.register User do
  permit_params :name, :password, :password_confirmation, :email, post_ids: []
  show do
    h3 user.name
    div "Email: " + user.email
    div "Зарегистрирован: " + user.created_at.strftime("%d.%m.%Y в %H:%M")
    div "Постов: " + user.posts.count.to_s
    div "Комментариев: " + user.comments.count.to_s
  end

  form title: "New user" do |f|
    f.inputs "User" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
