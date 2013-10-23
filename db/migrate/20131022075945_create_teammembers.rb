class CreateTeammembers < ActiveRecord::Migration
  def change
    create_table :teammembers do |t|
      t.integer :team_id
      t.integer :member_id

      t.timestamps
    end
  end
end
