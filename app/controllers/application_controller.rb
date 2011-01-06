class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
      def confirm_authenticity

          unless session[:admin_id]

              flash[:notice] = "please log in"
              redirect_to(:controller => 'admins', :action =>'login')

              return false
          else
              return true
          end
      end
  
end