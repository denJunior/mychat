class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: :user_id
  has_many :messages
  has_many :rooms, through: :messages

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable

  validates_presence_of     :email
  validates_uniqueness_of   :email
  paginates_per 5
end
