# frozen_string_literal: true

module TenantHomesHelper
  def new_tenant
    @tenant = Tenant.new
  end
end
