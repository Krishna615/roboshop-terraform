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
  records = [aws_instance.mongodb.private_ip]
}
resource "null_resource" "mongodb" {
  provisioner "remote-exec" {
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }


    inline = [
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost -U https://github.com/Krishna615/roboshop-ansible.git roboshop.yml -e component_name=mongodb -e env=dev",
    ]
  }

}