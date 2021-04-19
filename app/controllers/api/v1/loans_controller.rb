module Api
    module V1
        class LoansController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :authenticate 
            
            def index
                
                if loans = Loan.where(user_id: @user.id)
                    render json: LoanSerializer.new(loans).serialized_json
                else
                    render json: { message: "cannot locate #{@user.first_name}'s loans. If you haven't added one, please add one now, or reload browser and log back in."}, status: 400
                end
            end
            
            def show 

                if loan = Loan.find_by(id: params[:id])
                    render json: LoanSerializer.new(loan).serialized_json
                else
                    render json: { message: "Incorrect value or no such instance exists"}, status: 400
                end
            
            end


            def create
                
                loan = Loan.create(
                    nick_name: params[:nick_name],
                    bank_name: params[:bank_name],
                    current_bal: params[:current_bal],
                    min_payment: params[:min_payment],
                    actual_payment: params[:actual_payment],
                    last_four_acct: params[:last_four_acct],
                    payment_day: params[:payment_day],
                    user_id: @user.id
                    )

                    # render json: { loan: loan }
                    render json: LoanSerializer.new(loan).serialized_json
            end 

            def destroy
                loan = Loan.find_by(id: params[:id])
                    if !loan
                        render json: { message: "Could not locate and/or delete loan." }, status: 400
                    else
                        if loan.destroy
                            render json: LoanSerializer.new(loan).serialized_json
                        else
                            render json: { message: "Located loan, but something else went wrong. Sorry, try logging out and in/refresh, try again." }, status: 400
                        end
                    end
            end

            def update
                loan = Loan.find_by(id: params[:id])
                    loan.update(
                        nick_name: params[:nick_name],
                        bank_name: params[:bank_name],
                        current_bal: params[:current_bal],
                        min_payment: params[:min_payment],
                        actual_payment: params[:actual_payment],
                        last_four_acct: params[:last_four_acct],
                        payment_day: params[:payment_day],
                        user_id: @user.id
                        )
                
                    render json: LoanSerializer.new(loan).serialized_json
            end


            
        end
    end
end