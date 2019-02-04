class AddUserIdToChatMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_messages, :senderable_id, :integer
    add_column :chat_messages, :senderable_type, :string
    add_index :chat_messages, [:senderable_id,:senderable_type]
    # t.references :senderable, polymorphic: true
  end
end
