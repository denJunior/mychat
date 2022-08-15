class AddUserIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :messages, :user, foreign_key: true
  end
end
