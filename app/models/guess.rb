class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  # scope :correct, where(:correct => true)
  # has_many :users, through: :rounds
end
