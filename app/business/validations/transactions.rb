module Validations
  class Transactions
    def self.find_correct(transactions)
      transactions.select! { |transaction| valid_transactions?(transaction.first) }
    end

    def self.valid_transactions?(code)
      Cnae.types.value?(code)
    end
  end
end
