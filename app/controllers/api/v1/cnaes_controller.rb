module Api
  module V1
    class CnaesController < ::ApplicationController

      def index
        response = Cnae.all
        render json: response.to_json
      end

      def save
        response = params_save
        response.each { |transaction| Cnae.create_new(transaction) }
        render json: { message: 'Saved' }, status: 200
      end

      private

      def params_save
        transactions = ::Integrations::Cnab.new.extract
        validated = ::Validations::Transactions.find_correct(transactions)
        ::Constructor::Transactions.new(validated).generate
      end

    end
  end
end
