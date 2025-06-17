resource "aws_instance" "frontend-dev"{
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-087a8efc6ad6a9899"]
  tags = {
    Name = "frontend-dev"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z02373281TX1LHFU7BPXU"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.frontend.private_ip]
}