class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
      when Leader
        leaders_leader_path(current_leader)
      when User
        user_path(current_user)
    end
  end
  
  def after_sign_up_path_for(resource)
    case resource
      when Leader
        leaders_leader_path(current_leader)
      when User
        user_path(current_user)
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
end
