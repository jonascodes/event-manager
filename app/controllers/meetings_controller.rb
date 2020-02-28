class MeetingsController < ApplicationController

    def new
        @meeting = Meeting.new
    end

    def create
        @user = User.find_by(id: session[:user])
        if @user 
            puts "user found, build meeting"
            @meeting = @user.invites.build(meeting_params)
            puts "new meeting build"
            puts @meeting.inspect
            if @meeting.save
                redirect_to @meeting
            else
                render 'new'
            end
        else
            redirect_to root_url
        end
    end

    def show
        @meeting = Meeting.find(params[:id])
        @user = User.find(@meeting.creator_id)
    end

    def index
        @upcoming_meetings = Meeting.upcoming
        @past_meetings = Meeting.past
        puts @upcoming_meetings.inspect
        puts @past_meetings.inspect
    end

    private

        def meeting_params
            params.require(:meeting).permit(:title, :location, :datetime)
        end


end
