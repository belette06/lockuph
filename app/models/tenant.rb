# frozen_string_literal: true

class Tenant < ApplicationRecord
  belongs_to :user, optional: true

  has_many :tenant_homes
  has_many :homes, through: :tenant_homes
  has_many :appointements, through: :tenant_homes
end
