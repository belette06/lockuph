# frozen_string_literal: true

class CreateProprietors < ActiveRecord::Migration[5.2]
  def change
    create_table :proprietors do |t|
      t.references :user, foreign_key: true
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
