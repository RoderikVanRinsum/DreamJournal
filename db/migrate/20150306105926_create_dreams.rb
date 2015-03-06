class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :name
      t.text :description
      t.datetime :date

      t.timestamps null: false
    end
  end
end
