#example of deploying multiple resources with an implicit dependency

provider "aws" {
  region     = "us-east-1"
}

<<<<<<< HEAD:example2/example2.tf
resource "aws_s3_bucket" "example" {
  bucket = "tfex2578"
  acl    = "private"
}

=======
>>>>>>> 3ca3c048f321c5d38eb96767b0c4eabd2bf037df:example2/example2
resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.example]
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
