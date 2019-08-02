# frozen_string_literal: true

class Home < ApplicationRecord

  has_many :appointments
  has_many :tenants, through: :appointments
  accepts_nested_attributes_for :tenants

end
