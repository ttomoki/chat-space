class Message < ApplicationRecord
  validates :body_or_image, presence: true

  belongs_to :group
  belongs_to :user

  private
    def body_or_image
      body.presence or image.presence
    end
end
