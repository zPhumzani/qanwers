class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, limit: 30
      t.string :slug

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true
  end
end
