json.extract! chat_room, :id, :senderable_id, :senderable_type, :recieverable_id, :recieverable_type, :created_at, :updated_at
json.url chat_room_url(chat_room, format: :json)
