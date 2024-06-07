resource "aws_instance" "http_server" { 
ami = "ami-06292ffafe4773f6c"
key_name = "devops"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.http_server_sg.id] 
subnet_id = "subnet-084434d0d9ae9ae64"
tags = {
Name = "http_server_instance"
}
}
