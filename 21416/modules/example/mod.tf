resource "aws_vpc" "tf-21416-us-west-2" {
  provider = aws.us-west-2
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "terraform-gh-21416"
  }
}