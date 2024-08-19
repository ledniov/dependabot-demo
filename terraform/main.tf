terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

# Provider configuration
provider "aws" {
    region = "us-west-2"
}

# RDS instance
resource "aws_db_instance" "example_rds" {
    identifier             = "example-rds"
    engine                 = "postgres"
    engine_version         = "12.7"
    instance_class         = "db.t2.micro"
    allocated_storage      = 20
    storage_type           = "gp2"
    username               = "admin"
    password               = "password"
    publicly_accessible   = false
}

# Lambda function
resource "aws_lambda_function" "example_lambda" {
    function_name = "example-lambda"
    # renovate: datasource=endoflife-date depName=aws-lambda versioning=loose
    runtime       = "nodejs12.x"
    handler       = "index.handler"
    memory_size   = 128
    timeout       = 10

    # Add your Lambda function code here
    # ...

    # Add any necessary IAM permissions here
    # ...
}