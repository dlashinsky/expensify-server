class User < ApplicationRecord
    has_secure_password
    has_many :credit_cards
    has_many :fixed_expenses
    has_many :variable_expenses
    has_many :loans
end
