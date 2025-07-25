class AddFieldsToVideos < ActiveRecord::Migration[8.0]
  def change
    add_column :videos, :status, :integer, default: 0
  end
end
