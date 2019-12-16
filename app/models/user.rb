class User < ApplicationRecord
    has_secure_password
    has_many :commitments
    has_many :pledges, through: :commitments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
