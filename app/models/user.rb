class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :projects, dependent: :destroy
  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  validates :user_type, presence: true
  enum user_type: {
    developer: 0,
    manager: 1,
    qa: 2
  }
  after_initialize :set_default_user_type, if: :new_record?
  
  def set_default_user_type
    self.user_type ||= :developer
  end
end