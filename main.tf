#MAIN.TF FILE FOR CREATING EC2 USING VARIABLE:
# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


# create security group for the web server
# terraform aws create security group
resource "aws_security_group" "instance_sg" {
  name        = "terraform-sg"
  description = "enable http/https access on port 80/443 via alb sg and access on port 22 via ssh sg"
  

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 
  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "terraform_sg"
  }
}


#CREATION OF THE INSTANCE THAT WILL HOST THE WEBSITE

resource "aws_instance" "webapp" {
  ami           = var.aws_ami
  instance_type = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  user_data              = file("app.sh")
  
  tags = {
    Name = var.name
  }
}




