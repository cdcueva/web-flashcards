class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round
  # has_many :users, through: :rounds
end
