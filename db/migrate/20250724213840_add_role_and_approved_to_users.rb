class AddRoleAndApprovedToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :string, default: 'user'
    add_column :users, :approved, :boolean, default: false
  end
end
