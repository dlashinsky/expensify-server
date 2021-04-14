module Api
    module V1
        class CreditcardsController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :authenticate 
            
            def index
                creditcards = CreditCard.where(user_id: @user.id)
                # render json: { creditcards: creditcards }
                render json: CreditCardSerializer.new(creditcards).serialized_json
            end
        
            def create
                
                credit_card = CreditCard.create(
                    nick_name: params[:nick_name],
                    bank_name: params[:bank_name],
                    current_bal: params[:current_bal],
                    credit_limit: params[:credit_limit],
                    min_payment: params[:min_payment],
                    actual_payment: params[:actual_payment],
                    last_four_card: params[:last_four_card],
                    payment_day: params[:payment_day],
                    user_id: @user.id
                    )

                    # render json: { credit_card: credit_card }
                    render json: CreditCardSerializer.new(credit_card).serialized_json
            end
        end
    end
end