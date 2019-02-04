class ChatMessage < ApplicationRecord
	belongs_to :chat_room
	belongs_to :senderable, polymorphic: true
end
