class ChangeColumnAtProfile < ActiveRecord::Migration[5.2]
  def change
    rename_column :profile, :address, :address_id
  end
end
