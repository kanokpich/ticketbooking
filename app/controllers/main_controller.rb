class MainController < ApplicationController
    before_action :login_check, only: %i[ home inventory check_out ]

    def main 
        @timetables = Timetable.all
        session.delete(:user_id)
        if(!@user) 
            @user=User.new
        end
    end

    def home 
        @timetables = Timetable.all
        @beverages = Beverage.all
        @ticket = Ticket.new
        @product = Product.new
        @user = User.find_by(:id => session[:user_id])
        @inventory = Inventory.find_by(:user_id => @user.id)
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
                format.html { redirect_to '/home?user_id='+@user.id.to_s, notice: "Login successfully" }
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

    def ticket
        @user = User.find_by(:id => session[:user_id])
        @inventory = Inventory.find_by(:user_id => @user.id)
        @timetable = Timetable.find(params[:timetable_id])
        @chair = Chair.find_by(:id => params[:ticket][:chair_id])
        if(params[:commit]=='Add to inventory')
            @ticket = Ticket.new
            @ticket.timetable_id = @timetable.id
            @ticket.chair_id = @chair.id
            @ticket.inventory_id = @inventory.id 
            
            if @ticket.save
                redirect_to '/home/?user_id='+@user.id.to_s, notice: "Add to inventory successfully."
            end
        elsif(params[:commit]=='Remove')
            Ticket.find_by(:inventory_id => @inventory.id).destroy
            redirect_to '/inventory', alert: "Remove from inventory successfully."
        end
    end

    def beverage
        @user = User.find_by(:id => session[:user_id])
        @inventory = Inventory.find_by(:user_id => @user.id)
        @beverage = Beverage.find_by(:name => params[:beverage_id])
        if(params[:commit]=='Add beverage')
            @product = Product.new
            @product.beverage_id = @beverage.id
            @product.inventory_id = @inventory.id
            
            if @product.save
                redirect_to '/home/?user_id='+@user.id.to_s, notice: "Add beverage to inventory successfully."
            end
        elsif(params[:commit]=='Remove beverage')
            Product.find_by(:inventory_id => @inventory.id).destroy
            redirect_to '/inventory', alert: "Remove beverage from inventory successfully."
        end
    end

    def inventory
        @user = User.find_by(:id => session[:user_id])
        @inventory = Inventory.find_by(:user_id => @user.id)
        @ticket = Ticket.new
        @product = Product.new
        @inventory_ticket = @inventory.get_inventory_ticket
        @inventory_product = @inventory.get_inventory_product
        @inventory_price = @inventory.sum_price
    end 

    def check_out
        @user = User.find_by(:id => session[:user_id])
        @inventory = Inventory.find_by(:user_id => @user.id)
        Ticket.where(:inventory_id => @inventory.id).delete_all
        Product.where(:inventory_id => @inventory.id).delete_all
    end

    private
        def user_params
            params.require(:user).permit(:username, :password_digest, :password, :password_confirmation, :firstname, :lastname)
        end

        def login_check 
            if(session[:user_id])
              @user=User.find(session[:user_id])
            else
              redirect_to main_path, alert: "Please Login first."
            end
        end
end