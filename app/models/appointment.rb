# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :home
  belongs_to :tenant


  attr_accessor :tenant_id,:new_tenant_phone, :new_tenant_address

  before_save :create_tenant


  def create_tenant
    self.tenant = Tenant.create!(phone: new_tenant_phone, address: new_tenant_address ) if new_tenant_phone.present? || new_tenant_address.present?
  end

end
