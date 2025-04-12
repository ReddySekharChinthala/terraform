resource "aws_instance" "db" {
    ami = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = var.tags
  
}

# resource <resource_type> <resource_name>
resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description
    
    # terraform block
    ingress {
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = var.protocol
        cidr_blocks = var.allowed_cidr
    }

    egress {
        from_port = "0" # from 0 to 0 means, opening all ports
        to_port = "0"
        protocol = "-1" # -1 means all protocols
        cidr_blocks = var.allowed_cidr
    }

    tags = {
        Name = "allow_ssh"
        created_by = "ReddySekhar"
    }

}





    

    
    
