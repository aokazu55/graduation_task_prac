class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.datetime :date_of_birth
      t.string :gender
      t.string :address
      t.string :personality
      t.string :special_skills
      t.text :introduce
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
