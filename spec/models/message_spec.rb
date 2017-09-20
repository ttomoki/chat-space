require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid with body" do
     message = build(:message)
     expect(message).to be_valid
    end
    it "is valid with image" do
      message = build(:message)
      expect(message).to be_valid
    end
    it "is valid with body and image" do
      message = build(:message)
      expect(message).to be_valid
    end
    it "is invalid without body and image" do
      message = build(:message, body: nil, image: nil)
      message.valid?
      expect(message.errors[:body_or_image]).to include("を入力してください")
    end
    it "is invalid without group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください")
    end
    it "is invalid without user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end
  end
end