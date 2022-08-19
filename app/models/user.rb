# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :name , presence: true
  validates :email, :password_digest, :number, presence: true, uniqueness: true
  # validates :name, length: { minimum: 3, maximum: 15 }
  # validates :password, :format => {:with => /^[([a-z]|[A-Z])0-9_-]{6,40}$/, message: "must be at least 6 characters and include one number and one letter."}
  # validates :email,format: {:with =>  \A[A-Z0-9+_.-]+@[A-Z0-9.-]+\Z  , message: 'The email can contain both alphabets eg:mike@gmail.com', on: :create}
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: 'The email can contain both alphabets eg:mike@gmail.com', on: :create }
  # validates :password, length: { in: 6..10 }
  # validates :number, numericality: { equal_to: 10}
  # validates_presence_of :password, :on =>create

  # validates :name,
  #     :presence => {:message => "Name can't be blank." },
  #     :uniqueness => {:message => "Name already exists."},
  #     :length => { :maximum => 15, :message => "Must be less than 15 characters"}
  # validates :email,
  #     :presence => {:message => "Email can't be blank." },
  #     :uniqueness => {:message => "Email already exists."},
  #     :formate => {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
  #     :length => { :maximum => , :message => "Must be less than 100 characters"}
  

  # validates :title,
  #       :presence => {:message => "Title can't be blank." },
  #       :uniqueness => {:message => "Title already exists."},
  #       :length => { :maximum => 100, :message => "Must be less than 100 characters"}
end
