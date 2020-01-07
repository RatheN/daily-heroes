class Pledge < ApplicationRecord
    has_many :commitments
    has_many :users, through: :commitments

    scope :most_commitments, -> {(
        select("pledges.id, pledges.action, count(pledges.id) as pledge_count")
        .joins(:commitments)
        .group("pledges.id")
        .order("pledge_count DESC")
        .limit(5)
        )}
end
