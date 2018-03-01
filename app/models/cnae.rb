class Cnae < ApplicationRecord
  has_one :type

  # transaction type enum
  enum type: { debit: '1', credit: '4' }

  # Scope
  scope :create_new,->(transaction){
        where(cpf: transaction[:cpf])
          .where(date: transaction[:date])
          .where(value: transaction[:value])
          .first_or_create! } # validate if the transaction has already been saved
end
