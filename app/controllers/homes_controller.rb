# frozen_string_literal: true

class HomesController < ApplicationController
  before_action :set_homes, only: %i[show update edit destroy]

  def index
    @proprietor = current_user.proprietor
    @homes = @proprietor.homes.all
  end

  def show; end

  def new
    @home = Home.new
  end

  def create
    @proprietor = current_user.proprietor
    @home = @proprietor.homes.build(params_homes)
    if @home.save
      redirect_to @home, notice: 'Home create'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @home.update(params_homes)
      redirect_to @home, notice: 'updated..'
    else
      render :edit
    end
  end

  def destroy
    redirect_to @home, notice: 'destroy..' if @home.destroy(params_homes)
  end

  private

  def params_homes
    params.require(:home).permit(:name, :description, :online, :proprietor)
  end

  def set_homes
    @proprietor = current_user.proprietor
    @home = @proprietor.homes.find(params[:id])
  end
end
