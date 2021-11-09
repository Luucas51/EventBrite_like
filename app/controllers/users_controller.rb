class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_good_user?, only: [:show]

  def show
    @id = User.find(params[:id])
  end

  def is_good_user?
  	if current_user != User.find(params[:id])
  		redirect_to root_path
  	end
  end
  
end
