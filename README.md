# Ruby Lambda Template

This repository serves as a template for building AWS Lambda functions using Ruby. Customize it as needed to handle HTTP requests or other tasks in a serverless environment.

## Prerequisites

- Ruby
- Bundler
- AWS CLI

## Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/delian7/ruby_lambda_template
   cd ruby_lambda_template
   ```

2. **Install the dependencies:**

   ```sh
   bundle install
   ```

3. **Configure environment variables (if needed):**

   If you require environment configuration, copy the `.env.sample` file to `.env` and update it accordingly:

   ```sh
   cp .env.sample .env
   ```

## Running Tests

To run the tests using RSpec:

```sh
bundle exec rspec
```

## Deploying to AWS Lambda

1. **Configure AWS CLI:**

   ```sh
   aws configure
   ```

2. **Package the application:**

   ```sh
   zip -r lambda_function.zip .
   ```

3. **Update the Lambda function code:**

   ```sh
   aws lambda update-function-code --function-name your_lambda_function_name \
   --zip-file fileb://lambda_function.zip
   ```

*Alternatively, you can combine packaging and updating:*

```sh
zip -r lambda_function.zip . && aws lambda update-function-code --function-name your_lambda_function_name \
--zip-file fileb://lambda_function.zip
```

## Usage

This repository provides a starting point for AWS Lambda functions written in Ruby. Modify the Lambda function code and tests as needed for your specific use case.
