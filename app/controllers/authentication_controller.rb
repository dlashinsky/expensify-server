module Api
    module V1
        class AuthenticationController < ApplicationController
            protect_from_forgery with: :null_session
            
            def login
            user = User.find_by(email: params[:email])

                if !user
                    render json: { message: "Invalid username or password"}
                else
                    if user.authenticate(params[:password])
                        render json: { message: "You're logged in!"}
                    else
                        render json: { message: "Invalid username or password"}
                    end
                end
            end
        end
    end
end
