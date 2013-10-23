class AddTeammemberIndex < ActiveRecord::Migration
	def change
		add_index :teammembers, :team_id
		add_index :teammembers, :member_id
		add_index :teammembers, [:team_id, :member_id], unique: true
	end
end
