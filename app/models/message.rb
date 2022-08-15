class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :user_id
  belongs_to :room
  belongs_to :user

  broadcasts_to :room

  # validates :body, presence: true
  # validates_with MyValidator
end
