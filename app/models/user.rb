class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id", dependent: :destroy

  has_secure_password
end
