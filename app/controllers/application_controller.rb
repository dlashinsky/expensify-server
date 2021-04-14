class ApplicationController < ActionController::Base
    def authenticate
        authorization_header = request.headers[:authorization]

        if !authorization_header
            render json: { message: "unauthorized access" }
        else
            token = authorization_header.split(" ")[1]
            secret_key = Rails.application.secrets.secret_key_base[0]
            decoded_token = JWT.decode(token, secret_key)

            @user = User.find(decoded_token[0]["user_id"])
        end
    end
end
