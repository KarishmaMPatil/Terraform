variable "instanceami" {
    default = "ami-019715e0d74f695be"
}

variable "instancetype"  {
    default = "t3.micro"
}

variable "keyname"  {
    default = "ubuntu"
}

variable "sg"  {
    default = "sg-07474c841ef9cd4f6"
}

variable "api_termination" {
  default = false
} 

variable "nosofinstances" {
  default = 2
}