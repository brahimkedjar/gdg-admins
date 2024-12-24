class AddRequestAddMemberToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :request_add_member, :boolean
  end
end
