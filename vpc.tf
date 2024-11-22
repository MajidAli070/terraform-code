

 # create vpc 
  resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "My_VPC"
  }
}

// create subnet 
 resource "aws_subnet" "first_subnet" {
  vpc_id = aws_vpc.first_vpc.id
  cidr_block = "10.0.1.0/24"
   availability_zone = "us-east-2a"
   map_public_ip_on_launch = true
  tags = {
    Name = "Subnet"
  }
}

// create internet Gateway

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.first_vpc.id
  tags = {
    Name = "IGW"
  }
}

// create route table
resource "aws_route_table" "demo-rT" {
  vpc_id = aws_vpc.first_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "demo_RT"
  }
}


resource "aws_route_table_association" "demo-rt_association" {
  subnet_id = aws_subnet.first_subnet.id
  route_table_id = aws_route_table.demo-rT.id
}

   

   
    