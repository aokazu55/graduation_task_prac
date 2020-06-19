class ChangeColumnToProfile < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :gender, :gender_id
    rename_column :profiles, :personality, :personality_id
    rename_column :profiles, :special_skills, :special_skill_id
  end
end
