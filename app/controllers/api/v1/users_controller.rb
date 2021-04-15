module Api
    module V1
        class UsersController < ApplicationController
            protect_from_forgery with: :null_session
            def create
                founduser = User.find_by(email: params[:email])
                
                if !founduser
                    user = User.create(
                        email: params[:email],
                        first_name: params[:first_name],
                        last_name: params[:last_name],
                        password: params[:password],
                    )
                    secret_key = Rails.application.secrets.secret_key_base[0]
                    token = JWT.encode({
                        user_id: user.id,
                        email: user.email,
                        first_name: user.first_name,
                        last_name: user.last_name
                    }, secret_key)

                    render json: { token: token }
                else
                    render json: { message: "This email already exists!"}
                end
            end
        end
    end
end

