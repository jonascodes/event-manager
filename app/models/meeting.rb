class Meeting < ApplicationRecord
    belongs_to :user, foreign_key: "creator_id"
    has_many :guests

    scope :upcoming, -> { where('datetime >= ?', DateTime.now) }
    scope :past, -> { where('datetime < ?', DateTime.now) }

end
