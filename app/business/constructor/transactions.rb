module Constructor
  class Transactions

    def initialize(transactions)
      @transactions = transactions
    end

    def generate
      transactions_formatted = []
      @transactions.each do |transaction|
        transactions_formatted << {
          type_id: transaction[0].to_i,
          date: format_date(transaction[1..8]),
          value: format_value(transaction[9..18]).to_s,
          cpf: transaction[19..29],
          card: transaction[30..41],
          time: format_time(transaction[1..8], transaction[42..48])
        }
      end
      transactions_formatted
    end

    private

    def format_value(raw_value)
      raw_value.to_i / 100
    end

    def format_date(raw_date)
      Time.parse(raw_date).utc.strftime('%F')
    end

    def format_time(raw_date, raw_time)
      Time.parse(raw_time.prepend(raw_date)).utc.strftime('%T')
    end
  end
end
