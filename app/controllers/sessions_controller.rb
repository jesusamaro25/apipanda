class SessionsController < ApplicationController

  def create

    @user = User.find_by(username: params[:username],password: params[:password])
    #render json: user.as_json()
    # If the user exists AND the password entered is correct.
    if @user
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      render json: @user, status: :created
    else
      head(:unauthorized)
    end

  end

  def destroy
    
  end

end
