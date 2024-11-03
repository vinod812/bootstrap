output "vpc_name"{
    description="VPC name created"
    value=aws_vpc.vvvpc.id
}

output "public_subnet_name"{
    description="Name of public subnet created"
    value=aws_subnet.vv-public-1.id
}

output "private_subnet_name"{
    description="Name of private subnet created"
    value=aws_subnet.vv-private-1.id
}

output "internet_gateway"{
    description="Name of internet gateway"
    value=aws_internet_gateway.vv-igw.id
}

output "round_table"{
    description="Name of Round table"
    value=aws_route_table.vv-roundtable.id
}