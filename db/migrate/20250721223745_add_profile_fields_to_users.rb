class AddProfileFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :father_name, :string
    add_column :users, :cell_no, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :image, :string
  end
end
