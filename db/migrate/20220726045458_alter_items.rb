# frozen_string_literal: true

class AlterItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :category, :string
  end
end
