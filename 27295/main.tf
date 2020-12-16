# S3 bucket for code distribution
module "s3_code_distro" {
  source = ".\moduleDef"

  aws_region  = data.aws_region.current.name
  environment = var.environment
  prefix      = "prefix"
  name        = "code-distribution"


  # Enable lifecyle for code distribution
  advanced_config = {
    "lambda/release" = {
      transition = toset([{
        days          = 30
        storage_class = "STANDARD_IA"
      }])
    }
    "glue/releases" = {
      transition = toset([{
        days          = 30
        storage_class = "STANDARD_IA"
      }])
    }
    "infra" = {
      transition = toset([{
        days          = 30
        storage_class = "STANDARD_IA"
      }])
    }
    "lambda/snapshots" = {
      expiration = {
        days = 15
      }
    }
    "glue/snapshots" = {
      expiration = {
        days = 15
      }
    }
  }

}
