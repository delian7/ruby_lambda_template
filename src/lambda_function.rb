# frozen_string_literal: true

require 'json'

def lambda_handler(event:, context:) # rubocop:disable Lint/UnusedMethodArgument
  http_method = event['httpMethod']
  # resource = event['resource']
  # raw_data = event.dig('queryStringParameters', 'raw_data')

  case http_method
  when 'GET'
    send_response("hello from lambda!")
  else
    method_not_allowed_response
  end
rescue StandardError => e
  error_response(e)
end

def send_response(data)
  {
    'statusCode' => 200,
    'body' => JSON.generate(data)
  }
end

def method_not_allowed_response
  {
    'statusCode' => 405,
    'body' => JSON.generate({ error: 'Method Not Allowed' })
  }
end

def error_response(error)
  {
    'statusCode' => 500,
    'body' => JSON.generate({ error: error.message })
  }
end
