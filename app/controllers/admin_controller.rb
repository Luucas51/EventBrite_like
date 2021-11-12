class AdminController < ApplicationController
    before_action :check_if_admin
    def index
        @admin = current_user.admin?
    end



    private

    def check_if_admin
        unless current_user.admin?
        redirect_to root_path
        end
    end
    
end
