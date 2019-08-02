# frozen_string_literal: true

class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :name
      t.text :description
      t.boolean :online, default: false
      t.references :proprietor, foreign_key: true

      t.timestamps
    end
end
end
