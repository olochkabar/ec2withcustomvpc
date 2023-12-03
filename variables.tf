
variable "ingress" {
  type    = list(string)
  default = ["22", "443", "80", "8080"]
}

variable "egress" {
  type    = list(string)
  default = ["22", "443", "80", "8080"]
}


output "igw_id" {
  value = aws_internet_gateway.olochigw.id
}

output "vpc_id" {
  value = aws_vpc.olochvpc.id
}

output "olochsubnet" {
  value = aws_subnet.olochsubnet.id
}

output "sg_id" {
  value = aws_default_security_group.olochsg.id
}

variable "availability_zone" {
  default = "ca-central-1a"
}



/* variable "instance_type" {
  default =  ["t2.micro", "t2.medium", "t2.large"]
} */

variable "instance_type" {
  default = {
    dev = "t2.micro"
    staging = "t2.medium"
    prod = "t2.large"
  }
}