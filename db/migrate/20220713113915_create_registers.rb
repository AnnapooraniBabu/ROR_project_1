class CreateRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :registers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :number

      t.timestamps
    end
  end
end
