require 'rails_helper'
require 'byebug'

describe "API", type: :request do
  let(:token) { ENV['ACCESS_TOKEN'] }
  
  context 'GET /cnaes/save' do
    it 'save transactions' do
      VCR.use_cassette('api/v1/cnaes/save') do
        get '/api/v1/cnaes/save', params: {}, headers: {'TOKEN' => token}
        json = JSON.parse(response.body)

        expect(response).to be_success
        expect(json['message'].length).to eql(5)
        expect(json['message']).to eql('Saved')
      end
    end

    it 'wrong token passed' do
      VCR.use_cassette('api/v1/cnaes/save') do
        get '/api/v1/cnaes/save', params: {}, headers: {'TOKEN' => '12234'}
        json = JSON.parse(response.body)

        expect(response).to have_http_status(401)
        expect(json['error']).to eql('Bad credentials')
      end
    end
  end

  context 'GET /cnaes' do
    it 'get all transactions in database' do
      create(:cnae)
      get '/api/v1/cnaes', params: {}, headers: {'TOKEN' => token}
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json.size).to eql(1)
    end

    it 'get transaction in database applying filter' do
      create(:cnae)
      get '/api/v1/cnaes?type=credit&cpf=14014455509', params: {}, headers: {'TOKEN' => token}
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json.size).to eql(1)
    end
  end
end
