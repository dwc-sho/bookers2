class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:notice] = "Success. Updated User Info."
      redirect_to user_path
    else
      flash.now[:alert] = "Error. Could Not Update User Info."
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
