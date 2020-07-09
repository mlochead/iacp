#example of deploying multiple resources with an implicit dependency

provider "aws" {
  region     = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "tfex2578"
  acl    = "private"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.example]
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
