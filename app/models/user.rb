# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates :name, uniqueness: :true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
      if mood.positive?
      mood = "happy"
    else
      mood = "sad"
      end
    end
  end
end
