# frozen_string_literal: true

class Home < ApplicationRecord
  has_many :tenant_homes
  has_many :tenants, through: :tenant_homes
  has_many :appointements, through: :tenant_homes

  has_many :completed_appointements, -> { where(completed: true) },
           through: :tenant_homes,
           source: :appointements
end
