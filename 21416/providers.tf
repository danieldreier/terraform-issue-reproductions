provider "aws" {
}

provider "aws" {
  region = "us-west-2"
  alias = "us-west-2"
}

module "example" {
  source = "./modules/example"

  providers = {
    aws.us-west-2 = aws.us-west-2
  }
}