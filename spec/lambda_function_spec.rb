require 'json'
require_relative '../lambda_function'

RSpec.describe 'LambdaFunctionSpec' do
  let(:context) { {} }

  describe 'when invoked with a valid event' do
    subject(:response) { lambda_handler(event: event, context: context) }

    let(:event) { { 'message' => 'Hello, world!', 'httpMethod' => 'GET' } }


    it 'returns a status code of 200' do
      expect(response['statusCode']).to eq(200)
    end

    it 'returns a body that is valid JSON' do
      expect(response).to include('body')
      expect { JSON.parse(response['body']) }.not_to raise_error
    end
  end

  describe 'when invoked with an invalid event' do
    subject(:response) { lambda_handler(event: event, context: context) }

    let(:event) { { 'invalid_key' => 'unexpected data' } }


    it 'returns a status code of 400' do
      expect(response).to include('statusCode')
      expect(response['statusCode']).to eq(405)
    end

    it 'returns a body containing an error message' do
      body = JSON.parse(response['body'])
      expect(body).to include('error')
    end
  end

  describe 'when an exception is raised' do
    subject(:response) { lambda_handler(event: event, context: context) }

    let(:event) { nil }


    it 'returns a status code of 500' do
      expect(response).to include('statusCode')
      expect(response['statusCode']).to eq(500)
    end

    it 'returns a body with error details' do
      body = JSON.parse(response['body'])
      expect(body).to include('error')
    end
  end
end
