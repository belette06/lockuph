# frozen_string_literal: true

class CreateTenantHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :tenant_homes do |t|
      t.references :tenant, foreign_key: true
      t.references :home, foreign_key: true
    end
  end
end
