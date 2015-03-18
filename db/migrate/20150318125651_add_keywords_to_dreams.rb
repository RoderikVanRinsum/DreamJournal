class AddKeywordsToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :keywords, :text
  end
end
