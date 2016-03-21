class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :answer, index: true, foreign_key: true
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.string :slug

      t.timestamps null: false
    end
  end
end
