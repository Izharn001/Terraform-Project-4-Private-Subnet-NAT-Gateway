data "aws_ami" "latest_amazon_linux" {
    most_recent = true

    owners = ["amazon"]
    
    filter {
        name   = "name"
        values = ["al2023-ami-*-x86_64"]
    }
        
}

resource "aws_security_group" "ssh" {
    name        = "project-3-ssh"
    description = "Allow SSH access"
    vpc_id      = var.vpc_id

    ingress {
        description = "SSH from my IP"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.my_ip]
     
}

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]

}
    tags = {
        Name = "project-3-ssh"
    }
}

resource "aws_instance" "web_server" {   
    ami           = data.aws_ami.latest_amazon_linux.id
    instance_type = var.instance_type
    subnet_id     = var.subnet_id
    security_groups = [aws_security_group.ssh.id]

    tags = {
        Name = "project-3-ec2"
    }
  
}

