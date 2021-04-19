module Api
    module V1
        class FixedexpensesController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :authenticate 
            
            def index
                
                if expenses = FixedExpense.where(user_id: @user.id)
                    render json: FixedExpenseSerializer.new(expenses).serialized_json
                else
                    render json: { message: "cannot locate #{@user.first_name}'s Fixed Expenses. If you haven't added one, please add one now, or reload browser and log back in."}, status: 400
                end
            end
            
            def show 

                if expense = FixedExpense.find_by(id: params[:id])
                    render json: FixedExpenseSerializer.new(expense).serialized_json
                else
                    render json: { message: "Incorrect value or no such instance exists"}, status: 400
                end
            
            end


            def create
                
                fixed_expense = FixedExpense.create(
                    exp_name: params[:exp_name],
                    exp_type: params[:exp_type],
                    exp_amount: params[:exp_amount],
                    payment_day: params[:payment_day],
                    user_id: @user.id
                    )

                    # render json: { credit_card: credit_card }
                    render json: FixedExpenseSerializer.new(fixed_expense).serialized_json
            end 

            def destroy
                fixed_expense = FixedExpense.find_by(id: params[:id])
                    if !fixed_expense
                        render json: { message: "Could not locate and/or delete expense record." }, status: 400
                    else
                        if fixed_expense.destroy
                            render json: FixedExpenseSerializer.new(fixed_expense).serialized_json
                        else
                            render json: { message: "Located Expense, but something else went wrong. Sorry, try logging out and in/refresh, try again." }, status: 400
                        end
                    end
            end

            def update
                fixedexpense = FixedExpense.find_by(id: params[:id])
                    fixedexpense.update(
                        exp_name: params[:exp_name],
                        exp_type: params[:exp_type],
                        exp_amount: params[:exp_amount],
                        payment_day: params[:payment_day],
                        user_id: @user.id
                        )
                
                    render json: FixedExpenseSerializer.new(fixedexpense).serialized_json
            end
        end
    end
end