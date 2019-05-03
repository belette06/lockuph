# frozen_string_literal: true

class CreateAppointements < ActiveRecord::Migration[5.2]
  def change
    create_table :appointements do |t|
      t.boolean :completed
      t.daterange :reservation

      t.timestamps
    end
  end
end
