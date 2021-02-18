provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  alias = "us-west-2"
  region = "us-west-2"
}

module "example" {
  source = "./modules/example"
  for_each = toset(["hello"])

  providers = {
    aws.us-west-2 = aws.us-west-2
  }
}