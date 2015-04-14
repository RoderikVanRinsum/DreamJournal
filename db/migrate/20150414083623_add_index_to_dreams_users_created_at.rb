class AddIndexToDreamsUsersCreatedAt < ActiveRecord::Migration
  def change
    add_index :dreams, [:user_id, :created_at]
  end
end
