class CreateIndividuals < ActiveRecord::Migration[8.0]
  def change
    create_table :individuals do |t|
      t.string :name
      t.string :email
      t.string :role
      t.text :competence

      t.timestamps
    end
  end
end
