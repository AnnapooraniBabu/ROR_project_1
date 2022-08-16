class AlterAddColumnUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :card_details, :user_id, :bigint
  end
end
