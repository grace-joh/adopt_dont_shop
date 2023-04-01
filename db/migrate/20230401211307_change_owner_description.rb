class ChangeOwnerDescription < ActiveRecord::Migration[5.2]
  def change
    change_column_default :applications, :owner_description, nil
  end
end
