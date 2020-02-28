class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        @past_events = past_events(@user)
        @upcoming_events = upcoming_events(@user)
    end

    def index
        @users = User.all
    end

    def past_events(user) 
        user.invites.past
    end
    def upcoming_events(user) 
        user.invites.upcoming
    end

    private

        def user_params
            params.require(:user).permit(:username)
        end

end
