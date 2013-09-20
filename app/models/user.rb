class User < ActiveRecord::Base
  has_many :rounds
  has_many :decks, through: :rounds
  has_many :guesses, through: :rounds

  validates_uniqueness_of :email
  validates :email, presence: true
  validates :password, presence: true
  

  include BCrypt

  def password
    @password ||= Password.new(self.password_digest)
  end

  def password=(secret)
    @password = Password.create(secret)
    self.password_digest = @password
  end

end
