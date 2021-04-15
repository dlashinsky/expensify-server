module Api
    module V1
        class AuthenticationController < ApplicationController
            protect_from_forgery with: :null_session
            
            def login
                user = User.find_by(email: params[:email])

                if !user
                    render json: { message: "incorrect crudentials"}

                else
                   
                    if user.authenticate(params[:password])
                        secret_key = Rails.application.secrets.secret_key_base[0]
                        token = JWT.encode({
                            user_id: user.id,
                            email: user.email,
                            first_name: user.first_name,
                            last_name: user.last_name
                        }, secret_key)

                        render json: { token: token }
                    else
                        render json: { message: "incorrect crudentials"}
                    end

                end


                # elsif !user
                #     render json: { message: "invalid username and password" }
                # else
                #     render json: { message: "Invalid password" }
                # end
                
            end
        end
    end
end
