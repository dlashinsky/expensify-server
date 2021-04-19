module Api
    module V1
        class VariableexpensesController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :authenticate 
            
            def index
                
                if expenses = VariableExpense.where(user_id: @user.id)
                    render json: VariableExpenseSerializer.new(expenses).serialized_json
                else
                    render json: { message: "cannot locate #{@user.first_name}'s Expenses. If you haven't added one, please add one now, or reload browser and log back in."}, status: 400
                end
            end
            
            def show 

                if expense = VariableExpense.find_by(id: params[:id])
                    render json: VariableExpenseSerializer.new(expense).serialized_json
                else
                    render json: { message: "Incorrect value or no such instance exists"}, status: 400
                end
            
            end


            def create
                
                variable_expense = VariableExpense.create(
                    exp_name: params[:exp_name],
                    exp_type: params[:exp_type],
                    monthly_min: params[:monthly_min],
                    monthly_max: params[:monthly_max],
                    user_id: @user.id
                    )

                    # render json: { credit_card: credit_card }
                    render json: VariableExpenseSerializer.new(variable_expense).serialized_json
            end 

            def destroy
                variable_expense = VariableExpense.find_by(id: params[:id])
                    if !variable_expense
                        render json: { message: "Could not locate and/or delete expense record." }, status: 400
                    else
                        if variable_expense.destroy
                            render json: VariableExpenseSerializer.new(variable_expense).serialized_json
                        else
                            render json: { message: "Located Expense, but something else went wrong. Sorry, try logging out and in/refresh, try again." }, status: 400
                        end
                    end
            end

            def update
                variableexpense = VariableExpense.find_by(id: params[:id])
                    variableexpense.update(
                        exp_name: params[:exp_name],
                        exp_type: params[:exp_type],
                        monthly_min: params[:monthly_min],
                        monthly_max: params[:monthly_max],
                        user_id: @user.id
                        )
                
                    render json: VariableExpenseSerializer.new(variableexpense).serialized_json
            end
        end
    end
end