


resource "aws_security_group" "example" {
  name = "example"
  description = "Example security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
  }
}

resource "aws_instance" "instance1" {
ami = "ami-05930ce55ebfd2930"
instance_type = "t2.micro"
#security_groups = ["example"]
vpc_security_group_ids= [aws_security_group.example.id]
}
