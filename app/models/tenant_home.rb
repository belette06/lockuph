# frozen_string_literal: true

class TenantHome < ApplicationRecord
  belongs_to :tenant
  belongs_to :home

  has_many :appointments



end
