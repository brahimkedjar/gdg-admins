class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :leader_phone
      t.text :idea_description

      t.timestamps
    end
  end
end
