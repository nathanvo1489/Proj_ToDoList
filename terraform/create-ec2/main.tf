provider "aws" {
  region = "ap-southeast-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

#---From 2nd run onwards, use existing security group, to avoid creating a new security group every time
data "aws_security_group" "existing" {
  id = "sg-0fd733980fe0ad2fb"
}

resource "aws_instance" "app_server" {
  # create more machines for ansible playbook
  count = 3

  ami = data.aws_ami.ubuntu.id
  # index=1 for server-build, it needs 4GiB RAM
  instance_type = count.index == 1 ? "t3.medium" : "t3.small"
  key_name      = "devops"

  root_block_device {
    volume_size           = 10 #GiB
    volume_type           = "gp3"
    encrypted             = false
    delete_on_termination = true
  }

  #---to avoid security group duplication error---#
  # In the 1st run, assign to newly created security group
  # vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  # # In the 2nd run, assign to existing ecurity group
  vpc_security_group_ids = [data.aws_security_group.existing.id]

  # create more machines for ansible playbook
  tags = {
    Name = "terraform-ec2-${count.index + 1}"
  }
}

#---Create security group on 1st run only, comment below lines in the 2nd run
# resource "aws_security_group" "terraform_sg" {
#   name        = "terraform-ec2-sg"
#   description = "Security group for EC2 instance with SSH, HTTP, and HTTPS access"

#   ingress {
#     description = "Allow SSH from anywhere (inbound)"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     description = "Allow HTTP from anywhere (inbound)"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     description = "Allow HTTPS from anywhere (inbound)"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allow all outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

output "public_ip" {
  value = aws_instance.app_server[*].public_ip
}