class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, formate: {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  , message: 'Email must be valid'}
end
# /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/