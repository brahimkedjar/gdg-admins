class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :role
      t.text :competence
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
