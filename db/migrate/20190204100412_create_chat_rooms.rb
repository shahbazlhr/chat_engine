class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.references :senderable, polymorphic: true
      t.references :recieverable, polymorphic: true

      t.timestamps
    end
  end
end
