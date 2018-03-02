module Api
  module V1
    class CnaesController < ::ApplicationController
      include Swagger::Docs::Methods

      before_action :auth_token

      swagger_controller :cnaes, "Cnaes Api"
      swagger_api :index do
        summary "Fetches all Cnaes items"
        notes "List all Cnaes in database"
        param :query, :type, :string, :optional, "Transaction type"
        param :query, :value, :string, :optional, "Transaction value"
        param :query, :cpf, :string, :optional, "Transaction owner document"
        param :query, :card, :string, :optional, "Transaction card number"
        response :success
        response :forbidden, "Token was not passed in request header"
        response :unauthorized
      end

      swagger_api :save do
        summary "Create Cnaes items"
        notes "Create Cnaes that exists in cvs file"
        response :success
        response :forbidden, "Token was not passed in request header"
        response :unauthorized
      end

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
