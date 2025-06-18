
variable "instances" {
  default = {
    frontend = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.micro"

    }
    catalogue = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.micro"

    }
    mongodb = {
      ami_id = "ami-09c813fb71547fc4f"
      instace_type = "t2.micro"

    }

  }
}
variable "vpc_security_group_ids" {
  default = ["sg-087a8efc6ad6a9899"]
}
# variable "instance" {
#   default = {
#     catalogue = null,
#     frontend = null,
#     mongodb = null
#   }
# }
variable "zone_id" {
  default = "Z02373281TX1LHFU7BPXU"
}
variable "env" {
  default = "dev"
}