class AddTokenToUser < ActiveRecord::Migration
  def change
    add_column :jams, :token, :string
  end
end
