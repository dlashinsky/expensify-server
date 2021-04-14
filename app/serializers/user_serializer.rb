class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :first_name, :last_name

  has_many :credit_cards
  has_many :fixed_expenses
  has_many :variable_expenses
  has_many :loans
end
