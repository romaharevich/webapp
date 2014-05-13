class UsersController < ApplicationController
  

	def new
  		@user = User.new
			
	end

	def create
  		@user = User.new(params[:user])
  		if @user.save
    			redirect_to '/', :notice => "Signed up!"
  		else
    			render "new"
  		end
	end

	def list
		redirect_to root_url, :notice => "Please log in" if session[:user_id].nil?

		@user = User.find(:all)
	end

 	def show
		redirect_to root_url, :notice => "Please log in" if session[:user_id].nil?

    		@user = User.find(params[:id])
  	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])  
    		if @user.update_attributes(params[:user])  
      			redirect_to show, :notice => "User successfully updated." 
		end
	end
end
