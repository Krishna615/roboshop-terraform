resource "aws_instance" "mongodb"{
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-087a8efc6ad6a9899"]
  tags = {
    Name = "mongodb-dev"
  }
}
resource "aws_route53_record" "mongodb" {
  zone_id = "Z02373281TX1LHFU7BPXU"
  name    = "mongodb-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instace.mongodb.private_ip]
}