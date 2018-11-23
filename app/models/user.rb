class User < ApplicationRecord
  has_secure_password
  has_many :chars

  validates :password, presence: true
  validates :username, presence: true
  
  # This validation has not been tested yet
  validates :username, uniqueness: { case_sensitive: false,
    message: 'This username is already associated with an account' }
end
