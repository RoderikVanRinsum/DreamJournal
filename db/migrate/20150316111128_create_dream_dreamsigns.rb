class CreateDreamDreamsigns < ActiveRecord::Migration
  def change
    create_table :dream_dreamsigns do |t|
      t.references :dream, index: true
      t.references :dreamsign, index: true

      t.timestamps null: false
    end
    add_foreign_key :dream_dreamsigns, :dreams
    add_foreign_key :dream_dreamsigns, :dreamsigns
  end
end
