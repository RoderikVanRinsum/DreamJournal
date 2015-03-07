class AddLucidToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :lucid, :boolean
  end
end
