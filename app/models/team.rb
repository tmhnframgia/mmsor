class Team < ActiveRecord::Base
	belongs_to :creator, class_name: "User", foreign_key: "creator_id"
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :creator_id, presence: true

	has_many :teammembers, foreign_key: "team_id", dependent: :destroy
	default_scope -> { order('name') }

	def createdby?(other_user)
		creator == other_user
	end

	def joined?(other_user)
		teammembers.find_by(member_id: other_user.id)
	end

	def join!(other_user)
		teammembers.create!(member_id: other_user.id)
	end

	def leave!(other_user)
		teammembers.find_by(member_id: other_user.id).destroy!
	end
end
