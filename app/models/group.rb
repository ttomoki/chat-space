class Group < ApplicationRecord
  #validation
  validates_presence_of :group_name
  validates :group_name, uniqueness: true

  #association
  has_many :users, through: :group_users
  has_many :group_users
  has_many :messages
end
