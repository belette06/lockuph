# frozen_string_literal: true

class TenantsController < ApplicationController
  before_action :set_tenant, only: %i[show edit update]
  before_action :authenticate_user!

  def index
    @tenants = Proprietor.all
  end

  def new
    # @tenant = Tenant.new

    # @tenant = current_user.tenant.build_user
    @tenant = current_user.build_tenant
  end

  def show; end

  def create
    # @tenant= Tenant.new(params_tenant)
    # @tenant.user.id = current_user.id
    @tenant = if user_session
                current_user.build_tenant(params_tenant)
              else
                Tenant.create(params_tenant)
              end
    if @tenant.save
      flash[:success] = 'Content Successfully Created'
      redirect_to @tenant
    else
      render 'new'
    end
  end

  def edit
    set_tenant
  end

  def update
    set_tenant
    if @tenant.update(params_tenant)
      redirect_to @tenant, notice: 'updated..'
    else
      render :edit
    end
  end

  def destroy
    set_tenant
    redirect_to root_path, notice: 'destroy..' if @tenant.delete
  end

  private

  def params_tenant
    params.require(:tenant).permit(:phone, :address, :user)
  end

  def set_tenant
    @tenant = Tenant.find(params[:id])
  end
end
