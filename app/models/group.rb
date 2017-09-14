class Group < ApplicationRecord
  #validation
  validates :group_name, :user_ids, presence: true
  validates :group_name, uniqueness: true

  #association
  has_many :users, through: :group_users
  has_many :group_users
  has_many :messages
end
