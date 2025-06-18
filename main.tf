resource "aws_instance" "instance"{
  for_each = var.instance
  ami = ami[each.value]
  instance_type = instance_type[each.value]
  vpc_security_group_ids = vpc_security_group_ids[each.value]
  tags = {
    Name = each.key
  }

}
resource "aws_route53_record" "record" {
  for_each = var.instance
  zone_id = var.zone_id
  name    = "${each.key} - ${var.env}"
  type    = "A"
  ttl     = 10
  records = [aws_instance.instance[each.key].private_ip]
}
# resource "null_resource" "catalogue" {
#   provisioner "remote-exec" {
#   connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     password = "DevOps321"
#     host     = aws_instance.catalogue.private_ip
#   }
#
#
#     inline = [
#       "sudo pip3.11 install ansible",
#       "ansible-pull -i localhost -U https://github.com/Krishna615/roboshop-ansible.git roboshop.yml -e component_name=catalogue -e env=dev",
#     ]
#   }

#}