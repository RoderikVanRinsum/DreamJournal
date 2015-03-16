class CreateDreamsigns < ActiveRecord::Migration
  def change
    create_table :dreamsigns do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
