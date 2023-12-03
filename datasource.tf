data "aws_ami" "ami" {
  # provider = aws.usa
  most_recent = true
  owners      = ["463018831373"]

  filter {
    name   = "name"
    values = ["zm-public-nvidia-440.53-10.2-AL2-linux64-ami"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


/* data "aws_availability_zones" "olochaz" {
  state = "available"
} */

