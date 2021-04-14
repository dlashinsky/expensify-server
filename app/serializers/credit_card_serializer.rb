class CreditCardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :nick_name, :bank_name, :current_bal, :credit_limit, :min_payment, :actual_payment, :last_four_card, :payment_day, :user_id

end
