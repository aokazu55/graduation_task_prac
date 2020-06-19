class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :main_service
      t.string :service_detail
      t.string :service_name
      t.string :image_id
      t.string :confidence_level
      t.integer :price
      t.integer :working_time
      t.datetime :period_start
      t.datetime :period_end
      t.integer :estimated_days_required
      t.text :remark
      t.string :transportation_expenses
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
