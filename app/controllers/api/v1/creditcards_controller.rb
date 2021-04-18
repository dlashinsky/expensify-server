module Api
    module V1
        class CreditcardsController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :authenticate 
            
            def index
                
                if creditcards = CreditCard.where(user_id: @user.id)
                    render json: CreditCardSerializer.new(creditcards).serialized_json
                else
                    render json: { message: "cannot locate #{@user.first_name}'s credit cards. If you haven't added one, please add one now, or reload browser and log back in."}, status: 400
                end
            end
            
            def show 

                if creditcard = CreditCard.find_by(id: params[:id])
                    render json: CreditCardSerializer.new(creditcard).serialized_json
                else
                    render json: { message: "Incorrect value or no such instance exists"}, status: 400
                end
            
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

            def destroy
                credit_card = CreditCard.find_by(id: params[:id])
                    if !credit_card
                        render json: { message: "Could not locate and/or delete card." }, status: 400
                    else
                        if credit_card.destroy
                            render json: CreditCardSerializer.new(credit_card).serialized_json
                        else
                            render json: { message: "Located Card, but something else went wrong. Sorry, try logging out and in/refresh, try again." }, status: 400
                        end
                    end
            end

            def update
                creditcard = CreditCard.find_by(id: params[:id])
                    creditcard.update(
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
                
                    render json: CreditCardSerializer.new(creditcard).serialized_json
            end


            
        end
    end
end