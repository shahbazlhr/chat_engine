class ChatRoom < ApplicationRecord
  belongs_to :senderable, polymorphic: true
  belongs_to :recieverable, polymorphic: true
  has_many :chat_messages
end
