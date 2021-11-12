class Admin::UsersController < ApplicationController
    def index

    end
    def show
        @user = User.find(params[:id])
    end
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
 
        if @user.update('first_name' => params[:first_name],
                        'last_name' => params[:last_name],
                        'email' => params[:email])
        redirect_to admin_user_path(@user.id)
        else
          render :edit
        end
    
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to admin_users_path
    end
    
end
