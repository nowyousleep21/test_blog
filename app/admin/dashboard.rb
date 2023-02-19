# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    panel "Последние посты" do
      ul do
        Post.order(created_at: :desc).first(3).each do |post|
          li link_to post.title, admin_post_path(post)
        end
      end
    end

    br

    panel "Последние комментарии" do
      ul do
        Comment.order(created_at: :desc).first(3).each do |comment|
          li h4 (link_to comment.user.name, admin_user_path(comment.user)) + " прокомментировал пост " +
            (link_to comment.post.title, admin_post_path(comment.post))
            para "\"#{comment.body}\""
          br
        end
      end
    end
  end # content
end
