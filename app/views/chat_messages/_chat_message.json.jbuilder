json.extract! chat_message, :id, :chat_room_id, :message, :created_at, :updated_at
json.url chat_message_url(chat_message, format: :json)
