class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.text :body
      t.string :slug

      t.timestamps null: false
    end
    add_index :questions, :slug, unique: true
  end
end
