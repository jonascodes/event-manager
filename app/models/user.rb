class User < ApplicationRecord
    has_many :invites, :foreign_key => :creator_id, :class_name => "Meeting", :dependent => :destroy
end
