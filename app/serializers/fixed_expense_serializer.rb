class FixedExpenseSerializer
    include FastJsonapi::ObjectSerializer
    attributes :exp_name, :exp_type, :exp_amount, :payment_day, :user_id
  
  end
  