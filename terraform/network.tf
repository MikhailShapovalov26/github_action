resource "aws_vpc" "network" {
  cidr_block = "192.168.10.0/24"
  instance_tenancy = "default"
  tags = {
    "name" = "network_python"
  }
}

resource "aws_subnet" "subnet_aws_eu" {
    vpc_id = aws_vpc.network.id
    cidr_block = aws_vpc.network.cidr_block
    availability_zone       = "eu-west-3a"
    tags = {
      "name" = "subnet_python"
    }
}
resource "aws_internet_gateway" "gateway_aws_eu" {
  vpc_id = aws_vpc.network.id
}
