require 'rails_helper'
describe Message do
  describe '#create' do
    it "メッセージがあれば保存できる" do
     message = build(:message)
     expect(message).to be_valid
    end
    it "画像があれば保存できる" do
      message = build(:message)
      expect(message).to be_valid
    end
    it "メッセージと画像があれば保存できる" do
      message = build(:message)
      expect(message).to be_valid
    end
    it "メッセージも画像も無いと保存できない" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:body_or_image]).to include("を入力してください")
    end
    it "group_idが無いと保存できない" do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください")
    end
    it "user_idが無いと保存できない" do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end
  end
end