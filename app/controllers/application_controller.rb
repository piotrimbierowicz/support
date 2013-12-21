class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  private
    def authenticate_admin
      if current_user.role != User::Administrator
        raise ActionController::RoutingError.new('Not Found')
      end
    end

end
