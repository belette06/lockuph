# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :tenant
      t.references :home
      t.boolean :completed


      t.timestamps
    end
  end
end
