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

    def up
      change_column :appointments, :online, :boolean, default: false
    end

    def down
      change_column :appointments, :online, :boolean, default: nil
    end
  end
end
