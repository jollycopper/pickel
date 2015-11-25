class User < ActiveRecord::Base
  # name must be present
  validates :name,  presence: true, length: { maximum: 50 }
  # Regex for validating email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
end