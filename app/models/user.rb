class User < ApplicationRecord
    has_secure_password
    validates :name , :email, :password, :number, presence: true
    validates :name, length: { minimum: 3 }
    validates :email,formate: {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  , message: 'Email must be valid'}
    validates :password, length: { in: 6..10 }
    validates :number, numericality: { equal_to: 10}
end
# /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/