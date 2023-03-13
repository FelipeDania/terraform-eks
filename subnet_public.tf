resource "aws_subnet" "subnet_eks_public_1a" {
  vpc_id                  = aws_vpc.vpc_eks.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1) //"10.0.1.0/24"
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true



  tags = merge(
    local.tags,
    { Name = "${var.project_name}-public-subnet-1a",
    "kubernetes.io/role/elb" = 1 }

  )

}

resource "aws_subnet" "subnet_eks_public_1b" {
  vpc_id                  = aws_vpc.vpc_eks.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2) //"10.0.2.0/24"
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    { Name = "${var.project_name}-public-subnet-1b",
    "kubernetes.io/role/elb" = 1 }

  )

}

resource "aws_route_table_association" "eks_rtb_assoc_1a" {
  subnet_id      = aws_subnet.subnet_eks_public_1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_rtb_assoc_1b" {
  subnet_id      = aws_subnet.subnet_eks_public_1b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}