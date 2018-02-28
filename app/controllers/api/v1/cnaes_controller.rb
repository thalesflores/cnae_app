module Api
  module V1
    class CnaesController < ::ApplicationController

      def index
      end

      def save
        transactions = ::Integrations::Cnab.new.extract
        find_correct(transactions)
        render json: integration.to_json
      end

      private

       def find_correct(transactions)
         transactions.map! do |transaction|
          
         end
       end
    end
  end
end
