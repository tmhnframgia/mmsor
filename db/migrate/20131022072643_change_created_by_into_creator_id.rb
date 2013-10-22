class ChangeCreatedByIntoCreatorId < ActiveRecord::Migration
  def change
  	rename_column :teams, :created_by, :creator_id
  end
end
