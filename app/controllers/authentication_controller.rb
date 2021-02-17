class AuthenticationController < ApplicationController

    def login 
        @user = User.find_by({ username: params[:username] })
        if !@user 
            render json: {error: "Password or user incorrect"}, status: :unauthorized
        else 
            if !@user.authenticate params[:password]
                render json: {error: "Password or user incorrect"}, status: :unauthorized
            else
                payload = {
                    user_id: @user.id
                }
                secret = "Totally Secret"
                token = JWT.encode(payload, secret)

                render json: {token: token, user: @user}, status: :created 
            end
        end
    end

end
