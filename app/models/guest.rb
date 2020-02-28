class Guest < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    belongs_to :meeting, foreign_key: "meeting_id"

end
