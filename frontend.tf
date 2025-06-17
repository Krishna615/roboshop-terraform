resource "aws_instance" "frontend-dev"{
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  tags = {
    Name: frontend-dev
  }
}