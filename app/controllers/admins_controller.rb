class AdminsController < ApplicationController
  
  
  before_filter :confirm_authenticity, :only => [:index, :log, :show_log]
  layout 'admin'
  
  def index
      
  end
  
  # Shows the Login form.
  def login
      
  end
  #Logs users out and resets the session.
  def logout
      authorized_admin = Admin.find_by_id(session[:admin_id])
      temp_log = Log.new
      temp_log.action = "Logged out at " + Time.now.strftime("%H:%M:%S")
      authorized_admin.logs << temp_log
      authorized_admin.save(false)
      # Clear the session variables      
      session[:admin_id] = nil
      session[:name] = nil
      
      flash[:notice] = "Logged out, bye"
        redirect_to(:action => 'login')
  end

  # Checks the credentials supplied within form to Model-->DB.
  #Sets Session start if login is successful.
  def try_login
      
      authorized_admin = Admin.authenticate(params[:email], params[:password])
  
      if authorized_admin
          #manage sessions and session variables
          session[:admin_id] = authorized_admin.id
          session[:name] = authorized_admin.name
          
          #Set the last login time values
          authorized_admin.update_attribute(:last_login, Time.now.to_s(:db))
          
          #Set the activity log item values
            temp_log = Log.new
            temp_log.action = "Logged in at " + Time.now.strftime("%H:%M:%S")
            authorized_admin.logs << temp_log
            authorized_admin.save(false)
            
          redirect_to(:action => 'index')
          
      else
          flash[:notice] = "Ooops! Somthing is wrong with credentials."
          redirect_to(:action => 'login')      
      end
  end
  
  def log
     @all_admins = Admin.find(:all)
  end
  
  def show_log
      # to do :  group activities by log dates and show recent activity
      @selected_admin = Admin.find_by_id(params[:admin_id])
      @admin_logs = @selected_admin.logs

      @recent_log = @admin_logs.group("time(created_at)").order("time(created_at)")
  end
  
  #=======================================================================================================================
  #Membership Management
  
end
