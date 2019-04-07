class User < ApplicationRecord
  validates_presence_of :name, :email, :password, :access_level
  validates :email, email: true
end
