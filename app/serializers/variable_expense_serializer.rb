class VariableExpenseSerializer
    include FastJsonapi::ObjectSerializer
    attributes :exp_name, :exp_type, :monthly_min, :monthly_max, :user_id
  
  end