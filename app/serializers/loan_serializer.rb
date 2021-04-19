class LoanSerializer
    include FastJsonapi::ObjectSerializer
    attributes :nick_name, :bank_name, :current_bal, :min_payment, :actual_payment, :last_four_acct, :payment_day, :user_id
  
  end