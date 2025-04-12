variable "instance_names" {
    type = list
    default = ["db","backend","frontend"]
}

variable "image_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "common_tags" {
    default = {
        project = "Expense"
        Environment = "Dev"
        Terraform = "True"
    }
    
}
variable "sg_name" {
    type = string
    default = "allow_ssh"
}

variable "sg_description" {
    type = string
    default = "allowing port 22"
}

variable "sg_port" {
    type = number
    default = 22
}

variable "sg_protocol" {
    type = string
    default = "tcp"
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

