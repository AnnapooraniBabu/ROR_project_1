class User < ApplicationRecord
    has_secure_password

    # validates :name , :email, :password, :number, presence: true
    # validates :name, length: { minimum: 3, maximum: 15 }
    # validates :email,formate: {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  , message: 'Email must be valid', on: :create}
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
        #   :length => { :maximum => , :message => "Must be less than 100 characters"}


    # validates :title, 
    #       :presence => {:message => "Title can't be blank." },
    #       :uniqueness => {:message => "Title already exists."},
    #       :length => { :maximum => 100, :message => "Must be less than 100 characters"}
end

