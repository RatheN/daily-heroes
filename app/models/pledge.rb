class Pledge < ApplicationRecord
    has_many :commitments
    has_many :users, through: :commitments
end
