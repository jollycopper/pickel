class User < ActiveRecord::Base
  # Only save downcase email
  before_save { self.email = email.downcase }
  # name must be present
  validates :name,  presence: true, length: { maximum: 50 }
  # Regex for validating email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  # Add password digest to the model
  has_secure_password
  validates :password, presence: true, length: { maximum: 6 }
end