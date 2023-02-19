require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "validates body" do
    should validate_presence_of :body
  end

  it "belongs_to user" do
    should belong_to :user
  end

  it "belongs_to post" do
    should belong_to :post
  end
end
