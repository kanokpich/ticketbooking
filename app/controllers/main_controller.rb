class MainController < ApplicationController
    before_action :login_check, only: %i[ home ]

    def main 
        @timetables = Timetable.all
        session.delete(:user_id)
        if(!@user) 
            @user=User.new
        end
    end

    def home 
        @timetables = Timetable.all
    end 

    def login 
        session.delete(:user_id)
        if(!@user) 
            @user=User.new
        end
    end

    def logout 
        redirect_to '/main', alert: "Logout successfully"
    end

    def loged_in 
        @username = params[:user][:username]
        @password = params[:user][:password]

        @user = User.find_by(username:@username)

        respond_to do |format|
            if @user && @user.authenticate(@password)
                session[:user_id] = @user.id
                format.html { redirect_to '/home', notice: "Login successfully" }
                format.json { render json: @user }
            else
                session.delete(:user_id)
                format.html { redirect_to '/main',alert: "Invalid Email or Password. please try again" }
                format.json { render json: @user.errors,status: :unprocessable_entity}
            end
        end
    end

    def register
        @user = User.new
        @inventory = Inventory.new
    end

    def register_create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                create_inventory
                format.html { redirect_to '/main', notice: "Register successfully." }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :register, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def create_inventory
        @inventory = Inventory.new(:user_id => @user.id)
        @inventory.save
    end

    private
        def user_params
            params.require(:user).permit(:username, :password_digest, :password, :password_confirmation, :firstname, :lastname)
        end

        def login_check 
            if(session[:user_id])
              @user=User.find(session[:user_id])
            else
              redirect_to main_path, alert: "Please Login."
            end
        end
end