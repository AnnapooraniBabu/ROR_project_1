class AlterRegisters < ActiveRecord::Migration[6.1]
  def change
    # t.boolean :status
    change_column :registers, :number, :bigint

    # add_column :todos,:status, :boolean, :default=> false
    rename_column :registers, :password, :password_digest
    
  end
end
