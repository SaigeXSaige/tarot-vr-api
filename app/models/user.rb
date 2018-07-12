class User < ApplicationRecord
    has_secure_password
    
    has_many :readings
    validates :username, :first_name, :last_name, presence: true
    validates :username, uniqueness: true
    validates :password, length: {minimum:8, maximum: 18}, on: :create 
end
