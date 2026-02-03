resource "aws_instance" "webserver" {
  #arguements
  ami                    = var.instanceami
  instance_type          = var.instancetype
  vpc_security_group_ids = [ var.sg , aws_security_group.webserversg.id , data.aws_security_group.sg_gui.id] #cloudprovider_tfresourcegame.uniqueblockname.attribute
  key_name               = var.keyname
  count = var.numberofinstance        #2instance is created
  disable_api_termination = var.disableapitermination  #instance is not terminated
  tags = {
    Name    = "webserver-instance"
    purpose = "learning-terraform"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo -i 
                apt install apache2 -y
                systemctl start apache2
                EOF
} 


resource "aws_security_group"  "webserversg" {
      
      ingress { 
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      } 

      ingress { 
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      } 

      egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }

}

data "aws_security_group" "sg_gui" {
   name = "security for rds"    #name of securitygrp you want search in aws console
}


#datatypes
#1     1=  number
#2    "kari"  = string
#3     true  = boolean
#4     2.1 = float