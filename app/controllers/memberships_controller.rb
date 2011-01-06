class MembershipsController < ApplicationController
      before_filter :confirm_authenticity, :only => [:index]
    def index
        @all_memberships = Membership.order("memberships.title ASC")
        #render :text => @memberships.length
    end
    
    def list
        
    end
    
    def new
        @membership = Membership.new(:title => "", :price => 9.00, :description => "Enter membership description here")
    end
    
    def create
        
       @membership = Membership.new(params[:membership])
       
       if @membership.save
           c_admin = Admin.find_by_id(session[:admin_id])
           l = Log.new
           l.action = "Created new Membership " + '[ ' +  @membership.title  + ' ]'
           c_admin.logs << l
           c_admin.save(false)
           redirect_to(:action => 'index')
           
        else
            render('new')
       end
        
    end
    
end
