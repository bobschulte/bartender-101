class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
