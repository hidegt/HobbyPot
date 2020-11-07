class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
      when Leader
        # leaders_path
        root_path
      when User
        users_path
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
end