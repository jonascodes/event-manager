class SessionsController < ApplicationController

    def new

    end

    def create 
        @user = User.find_by(username: params[:username])
        if @user 
            session[:user] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_url
        end
    end

    def destroy
        puts "calling destroy"
        session[:user] = nil
        redirect_to(request.referrer || root_path)
    end

end
