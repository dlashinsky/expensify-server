module Api


    module V1
        class UsersController < ApplicationController
            protect_from_forgery with: :null_session
            def create
        
                user = User.create(
                    email: params[:email],
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    password: params[:password],
                )
                render json: user
            end
        
        end

    end
end

