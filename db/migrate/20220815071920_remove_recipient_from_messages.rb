class RemoveRecipientFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :recipient_id
  end
end
