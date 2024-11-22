
resource "aws_instance" "demo" {
  ami                     = "ami-0ea3c35c5c3284d82"
  instance_type           ="t2.micro"
  subnet_id              = aws_subnet.first_subnet.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  associate_public_ip_address = true
  key_name                = aws_key_pair.tfkey.key_name

tags ={
    Name = "HelloWorld"

  }
}