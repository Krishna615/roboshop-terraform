variable "ami" {
  default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  default= "t2.micro"
}
variable "vpc_security_group_id" {
  default = "sg-087a8efc6ad6a9899"
}
variable "instance" {
  default = {
    catalogue = null,
    frontend = null,
    mongodb = null
  }
}
variable "zone_id" {
  default = "Z02373281TX1LHFU7BPXU"
}
variable "env" {
  default = "dev"
}