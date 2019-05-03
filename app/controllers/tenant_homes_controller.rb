# frozen_string_literal: true
#
include new_tenant
class TenantHomesController < ApplicationController
  before_action :set_tenant_homes, only: %i[show edit update destroy]

  def index
    @tenant_homes = TenantHomes.all
  end

  def show; end

  def new

    @tenant_home = TenantHome.new
  end

  def edit; end

  def create
    @tenant_home = TenantHome.new(tenant_home_params)
    @tenant_home.home_id = Home.find(params[:id])
      redirect_to new_home_tenant_home_path if tenant_fields.sumbit
    @tenant_home.tenant_id = tenant

    respond_to do |format|
      if @tenant_home.save
        format.html { redirect_to @tenant_home, notice: 'tenant_home was successfully created.' }
        format.json { render :show, status: :created, location: @tenant_home }
      else
        format.html { render :new }
        format.json { render json: @tenant_home.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tenant_home.update(tenant_home_params)
        format.html { redirect_to @tenant_home, notice: 'tenant_home was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant_home }
      else
        format.html { render :edit }
        format.json { render json: @tenant_home.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tenant_home.destroy
    respond_to do |format|
      format.html { redirect_to tenant_homes_url, notice: 'tenant_home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



    private

  # Use callbacks to share common setup or constraints between actions.
  def set_tenant_homes
    @tenant_home = TenantHome.find(params[:id])
  end

  def tenant_home_params
    params.require(:tenant_home).permit(:home_id, :tenant_id)
  end

  end
