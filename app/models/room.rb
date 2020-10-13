class Room < ApplicationRecord
  has_many :room_users
  has_many :users, throught: :room_users
end
