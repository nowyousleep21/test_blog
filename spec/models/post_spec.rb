require 'rails_helper'

RSpec.describe Post, type: :model do
  it "validates title" do
    should validate_presence_of :title
  end

  it "validates content" do
    should validate_presence_of :content
  end

  it "belongs_to user" do
    should belong_to :user
  end

  it "has_many comments" do
    should have_many :comments
  end

  it "has_one_image" do
    have_one_attached :image
  end
end
