class Team < ActiveRecord::Base
	belongs_to :creator, class_name: "User", foreign_key: "creator_id"
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :creator_id, presence: true
end
