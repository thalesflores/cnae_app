module Api
  module V1
    class CnaesController < ::ApplicationController
      before_action :auth_token

      def index
        @transactions = Cnae.where(nil)
        response = params_filter
        render json: response.to_json
      end

      def save
        response = params_save
        response.each { |transaction| Cnae.create(transaction) }
        render json: { message: 'Saved' }, status: 200
      end

      private

      def params_save
        transactions = ::Integrations::Cnab.new.extract
        validated = ::Validations::Transactions.find_correct(transactions)
        ::Constructor::Transactions.new(validated).generate
      end

      def params_filter
        filtering.each do |key, value|
          @transactions = @transactions.public_send(key, value) if value.present?
        end
        @transactions 
      end

      def filtering
        params.slice(:type, :value, :cpf, :card)
      end
    end
  end
end
