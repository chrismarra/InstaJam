class AddPhotosToJam < ActiveRecord::Migration
  def change
    add_column :jams, :photo, :string
  end
end
