require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.create(name: "JoKeMaN")}

  it "validates name" do
    should validate_length_of :name
  end

  it "has_many comments" do
    should have_many :comments
  end

  it "has_many posts" do
    should have_many :posts
  end

  it "capitalizing name" do
    expect(user.name).to eq("Jokeman")
  end
end
