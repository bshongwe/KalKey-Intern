resource "aws_security_group" "http_server_sg" {
name = "http_server_sg" vpc_id = "vpc-c4e4ebac" 
ingress{ // for HTTP
from_port = 80
protocol = "tcp" 
to_port = 80
cidr_blocks = ["0.0.0.0/0"]
}

ingress { // for SSH
from_port = 22
protocol = "tcp"
to_port = 22
cidr_blocks = ["0.0.0.0/0"]

egress {
from_port = 0
protocol = -1
to_port = 0
cidr_blocks = ["0.0.0.0/0"]

tags = {
Name = "http_server_sg"
}
}
