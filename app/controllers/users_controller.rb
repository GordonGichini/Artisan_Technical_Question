class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action :require_same_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user), notice: "User created successfully."
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        # List currently borrowed (not yet returned) books
        @borrowings = @user.borrowings.where(returned: false)
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user 
        @user = User.find(params[:id])
    end

    def require_same_user
        unless @user.id == current_user&.id
            flash[:alert] = "Access denied"
            redirect_to root_path 
        end
    end
end