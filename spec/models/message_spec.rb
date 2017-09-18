require 'rails_helper'
describe Message do
  describe '#create' do
    it "メッセージがあれば保存できる" do
     message = build(:message)
     expect(message).to be_valid
    end
  end
end