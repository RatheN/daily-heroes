class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :locations, through: :posts

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
