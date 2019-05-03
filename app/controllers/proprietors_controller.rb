# frozen_string_literal: true

class ProprietorsController < ApplicationController
  before_action :set_proprietor, only: %i[show edit update]
  before_action :authenticate_user!

  def index
    @proprietors = Proprietor.all
  end

  def new
    # @proprietor = Proprietor.new
    # @proprietor = current_user.proprietor.build_user
    @proprietor = current_user.build_proprietor
  end

  def show
    @proprietor = current_user.proprietor.build_user
  end

  def create
    # @proprietor = Proprietor.new(params_proprietor)
    # @proprietor.user.id = current_user.id
    @proprietor = current_user.build_proprietor(params_proprietor)
    if @proprietor.save(params_proprietor)
      format.html { redirect_to @proprietor, notice: 'Proprietor was successfully create.' }
      format.json { render :show, status: :ok, location: @proprietor }
    else
      format.html { render :edit }
      format.json do  render json: @proprietor.errors, status: :unprocessable_entity
      end
    end
   end

  def edit
    set_proprietor
  end

  def update
    set_proprietor
    if @proprietor.update(params_proprietor)
      format.html { redirect_to @proprietor, notice: 'Proprietor was successfully updated.' }
      format.json { render :show, status: :ok, location: @proprietor }
    else
      format.html { render :edit }
      format.json { render json: @proprietor.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    set_proprietor
    if @proprietor.destroy(doctor_params)
      format.html { redirect_to @proprietor, notice: 'Proprietor was successfully destroy.' }
      format.json { render :show, status: :ok, location: @proprietor }
    else
      format.html { render :edit }
      format.json { render json: @proprietor.errors, status: :unprocessable_entity }
    end
  end

  private

  def params_proprietor
    params.require(:proprietor).permit(:phone, :address, :user)
  end

  def set_proprietor
    @proprietor = Proprietor.find(params[:id])
  end
end