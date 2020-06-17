class User < ApplicationRecord
    before_save {self.email = email.downcase}
    
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL },
                      uniqueness: true
    
    has_secure_password
    validates :password, length: { minimum: 6 }, presence: true
end