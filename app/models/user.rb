class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
         
  has_many :chat_rooms_as_sender, :class_name => "ChatRoom", as: :senderable
  has_many :chat_rooms_as_reciever, :class_name => "ChatRoom", as: :recieverable
  has_many :chat_messages, as: :senderable
end
