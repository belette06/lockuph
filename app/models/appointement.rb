# frozen_string_literal: true

class Appointement < ApplicationRecord
  belongs_to :tenant_home
  accepts_nested_attributes_for :tenant_home

  has_many :homes, through: :tenant_home
  has_many :tenants, through: :tenant_home
  end
