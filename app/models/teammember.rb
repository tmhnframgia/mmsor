class Teammember < ActiveRecord::Base
	belongs_to :team
	belongs_to :member, class_name: "User"
	
	validates :member_id, presence: true
	validates :team_id, presence: true
end
