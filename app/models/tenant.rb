# frozen_string_literal: true

class Tenant < ApplicationRecord
  belongs_to :user, optional: true

  has_many :appointments
  has_many :homes, through: :appointments
  accepts_nested_attributes_for :homes
end
