class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :gender
      t.date :date_of_birth
      t.string :country
      t.string :interest
      t.string :website
      t.string :professional_skills
      t.string :language
      t.string :about_you

      t.timestamps null: false
    end
  end
end
