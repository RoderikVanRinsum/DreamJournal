class AddUserRefToDreams < ActiveRecord::Migration
  def change
    add_reference :dreams, :user, index: true
    add_foreign_key :dreams, :users
  end
end
