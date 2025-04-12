# resource <resource_type> <resource_name>
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"
    
    # terraform block
    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = "0" # from 0 to 0 means, opening all ports
        to_port = "0"
        protocol = "-1" # -1 means all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        created_by = "ReddySekhar"
    }

}

resource "aws_instance" "db" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        Name = "db"
    }
  
}



    

    
    
