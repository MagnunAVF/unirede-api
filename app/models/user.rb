class User < ApplicationRecord
  @@possible_access_levels = ["internal", "client", "admin"]

  validates_presence_of :name, :email, :password, :access_level
  validates :email, email: true
  validate :in_possible_access_level

  def self.possible_access_levels
    @@possible_access_levels
  end

  private
  def in_possible_access_level
    if !@@possible_access_levels.include?(access_level)
      errors.add(:access_level, "must be in possible access levels list")
    end
  end
end
