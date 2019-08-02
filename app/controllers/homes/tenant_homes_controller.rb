# frozen_string_literal: true

    class Homes::TenantHomesController < ApplicationController


      def index
        @home = Home.find(params[:format])
        @tenant_homes = @home.tenant_homes
      end

      def show
        @home = Home.where(params[:home_id])
        @tenant_home = TenantHome.find(params[:id])
      end

      def edit
        @tenant_home = TenantHome.find(params[:id])
      end

      def new
        @tenant_home =  TenantHome.new
        @tenant_home.tenant = Tenant.new
      end

      def create
        @tenant_home = TenantHome.new
        @tenant_home.home_id = @home.id
        @tenant_home.tenant = Tenant.new
        @tenant_home.tenant.save(params_tenant_home)
        @tenant_home.tenant_id = @tenant_home.tenant.id

        if @tenant_home.save
          redirect_to @tenant_home
        end
      end

      def update
        @tenant_home = TenantHome.find(params[:id])
        if @tenant_home.update(params_tenant_home)
          redirect_to homes_tenant_home_path(@tenant_home.id), notice: 'tenant_home was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @tenant_home = TenantHome.find(params[:id])
        @tenant_home.delete(params_tenant_home)
        redirect_to homes_tenant_homes_path, notice: 'tenant_home was successfully destroyed.'
      end

      private

      # require 'pry', <%=binding.pry %>
      def save_homes

      end

      def params_tenant_home
        params.require(:tenant_home).permit(:home_id, :tenant_id)
      end
    end

