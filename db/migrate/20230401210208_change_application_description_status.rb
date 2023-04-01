class ChangeApplicationDescriptionStatus < ActiveRecord::Migration[5.2]
  def change
    rename_column :applications, :description, :home_description
    change_column_default :applications, :status, 'In Progress'
    add_column :applications, :owner_description, :text
  end
end
