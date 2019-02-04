class AddUserIdToChatMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_messages, :user_id, :integer
    add_index :chat_messages, :user_id
  end
end
