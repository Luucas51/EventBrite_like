module ApplicationHelper
    def is_admin
        if current_user.admin == false || current_user == nil
            redirect_to root_path
        end
    end
end
