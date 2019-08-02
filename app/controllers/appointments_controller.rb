# frozen_string_literal: true

class AppointmentsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  #before_action :authenticate_user!
  #before_action :set_home, only: %i[index new create edit]
  #before_action :set_proprietor, only: %i[index new create edit show]
  #before_action :set_appointment, only: %i[show edit update destroy]

  def show; end

  def new
    @appointment = Appointment.new
  end

  def create
    @home = Home.find(params[:home_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.home_id= @home
    @appointment.tenant_id= tenant_id
    #require 'pry'
    #binding.pry
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
     end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to @appointments_url, notice: 'Appointement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_appointment
    @appointment = Appointement.find(params[:id])
  end

  def set_home
    @proprietor = current_user.proprietor
   # @homes = @proprietor.homes.find(params[:home_id])
  end

  def set_proprietor
    @proprietor = current_user.proprietor
  end

  def appointment_params
    params.require(:appointment).permit(:reservation, :completed, :home_id, :tenant_id)
  end
end
