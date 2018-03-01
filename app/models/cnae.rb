class Cnae < ApplicationRecord
  has_one :type

  # transaction type enum
  enum type_id: { debit: 1, credit: 4 }

  #Scope for filters
  scope :type,->(type){ where(type_id: type) }
  scope :value,->(value){ where(value: value) }
  scope :card,->(card){ where(card: card) }
  scope :cpf,->(cpf){ where(cpf: cpf) }
end
