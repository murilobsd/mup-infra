terraform {
  required_version = ">= 1.0.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }

  /*
   *  Using S3, DynamoDB to state file and global lock
   *
   *  This key will change depending on the application, for now the default will be:
   *  "environment/service/terraform.state"
   */

  backend "s3" {
    bucket         = "mup-terraform-state"
    key            = "infra/terraform.tfstate"
    dynamodb_table = "mup-terraform-state-locking"
    encrypt        = true
    region         = "us-east-1"
  }

}

