class Group < ApplicationRecord
  validates :name, presence: true

  has_many :users,through: :user_groups
  has_many :user_groups
  has_many :messages
  
end
