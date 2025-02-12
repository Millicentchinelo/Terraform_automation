#VARIABLE.TF FILE FOR CREATING EC2 INATANCE:
# Variable was created using the variable prompt without having to look at the documentation

variable "aws_ami" {
    description = "the ami of the instance to be created"

 
}

variable "name" {
    type = string
    description = "name of the created instance"
  
}


variable "instance_type" {
    type = string
    description = "the type of instance"
    default = "t2.micro" #HERE THE DEFAULT VALUE FOR INSTANCE TYPE IS ADDED
  
}

variable "key_name" {
    type = string
  
}




