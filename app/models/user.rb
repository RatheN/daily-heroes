class User < ApplicationRecord
    has_secure_password
    has_many :commitments
    has_many :pledges, through: :commitments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.name = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end
