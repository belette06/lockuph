# frozen_string_literal: true

require 'pry'
class AppointementsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_home, only: %i[index new create edit]
  before_action :set_proprietor, only: %i[index new create edit show]
  before_action :set_appointment, only: %i[show edit update destroy]

  def show;     end

  def new
    @appointment = Appointement.new
  end

  def create
    @appointement = Appointement.new(appointement_params)
    respond_to do |format|
      if @appointement.save
        format.html { redirect_to @appointement, notice: 'Appointement was successfully created.' }
        format.json { render :show, status: :created, location: @appointement }
      else
        format.html { render :new }
        format.json { render json: @appointement.errors, status: :unprocessable_entity }
      end
    end
     end

  def update
    respond_to do |format|
      if @appointement.update(appointement_params)
        format.html { redirect_to @appointment, notice: 'Appointement was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointement }
      else
        format.html { render :edit }
        format.json { render json: @appointement.errors, status: :unprocessable_entity }
      end
    end
    end

  def destroy
    @appointement.destroy
    respond_to do |format|
      format.html { redirect_to appointements_url, notice: 'Appointement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_appointement
    @appointement = Appointement.find(params[:id])
  end

  def set_home
    @proprietor = current_user.proprietor
    @home = @proprietor.homes.find(params[:home_id])
  end

  def set_proprietor
    @proprietor = current_user.proprietor
  end

  def appointement_params
    params.require(:appointement).permit(:reservation, :home_id, :tenant_id)
  end
end
