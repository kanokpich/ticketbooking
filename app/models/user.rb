class User < ApplicationRecord
    validates :username, presence: true
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :password_digest, presence: true
    has_secure_password
    validates_confirmation_of :password
end
