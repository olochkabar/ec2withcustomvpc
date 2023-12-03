resource "aws_instance" "oloch_instance" {
  ami           = data.aws_ami.ami.id
  # for_each = toset (var.instance_type)
    for_each = var.instance_type
  instance_type = each.value
  #  data.aws_availability_zones.olochaz
  availability_zone      = var.availability_zone
  key_name               = "terraformkey"
  vpc_security_group_ids = [ aws_default_security_group.olochsg.id ]
  subnet_id              = aws_subnet.olochsubnet.id
  user_data              = file("${path.module}/userdata.sh")
  associate_public_ip_address = true
  tags = {
   # for_each = var.instance_name
    Name = "olochi-${each.key}"
  }
}
