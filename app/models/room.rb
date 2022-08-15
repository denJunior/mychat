class Room < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  scope :public_rooms, -> { where(is_private: false) }

  validates_presence_of     :title
  validates_uniqueness_of   :title
end
