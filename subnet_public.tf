//variable "subnet_id" {}
//
//data "aws_subnet" "selected" {
//  id = var.subnet_id
//}
//
//resource "aws_security_group" "subnet" {
//  vpc_id = data.aws_subnet.selected.vpc_id
//
//  ingress {
//    cidr_blocks = [data.aws_subnet.selected.cidr_block]
//    from_port   = 80
//    to_port     = 80
//    protocol    = "tcp"
//  }
//}

resource "aws_subnet" "subnet_eks_public_1a" {
  vpc_id                  = aws_vpc.vpc_eks.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1) //"10.0.1.0/24"
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "comunidadedevops-subnet-1a"
    "kubernetes.io/role/elb" = 1
  }

}

resource "aws_subnet" "subnet_eks_public_1b" {
  vpc_id                  = aws_vpc.vpc_eks.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2) //"10.0.2.0/24"
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "comunidadedevops-subnet-1b"
    "kubernetes.io/role/elb" = 1
  }

}