

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Demo security group"
   vpc_id      = aws_vpc.first_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


  
