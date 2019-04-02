
class ProprietorsController < ApplicationController
  before_action :set_proprietor, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
    @proprietors = Proprietor.all

  end

  def new
    #@proprietor = Proprietor.new

   # @proprietor = current_user.proprietor.build_user
    @proprietor = current_user.build_proprietor
  end

  def show
    @proprietor = current_user.proprietor.build_user
  end

  def create
    #@proprietor = Proprietor.new(params_proprietor)
    #@proprietor.user.id = current_user.id
    @proprietor = current_user.build_proprietor(params_proprietor)
    if @proprietor.save
      flash[:success] = "Content Successfully Created"
      redirect_to @proprietor
    else
      render 'new'
    end
   end


  def edit
    set_proprietor
  end

  def update
    set_proprietor
    if @proprietor.update(params_proprietor)
      redirect_to @proprietor, notice: "updated.."
    else
      render :edit
    end
  end

  def destroy
    set_proprietor
    if @proprietor.destroy
      redirect_to root_path, notice: "destroy.."
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