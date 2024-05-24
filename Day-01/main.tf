# Provider configuration for AWS in the us-east-1 region.
provider "aws" {
  region = "us-east-1"
}

# Resource for launching an EC2 instance with a user data script for youb server setup.
resource "aws_instance" "youb_server" {
  ami           = "ami-xxxxxxxxxxxxxxx"
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"
  # Tags the instance as "youb-Server" for easy identification.
  tags = {
    Name = "youb-Server"
  }

  # Attaches a security group allowing HTTP traffic to the instance.
  vpc_security_group_ids = [
    aws_security_group.youb_server_security_group.id
  ]

  # User data script to install and configure Apache youb server.
  user_data = <<-EOF
              #!/bin/bash
              yum -y install httpd
              systemctl enable httpd
              systemctl start httpd
              echo '<html><h1>Hello From Your youb Server!</h1></html>' > /var/www/html/index.html
              EOF
}

# Security group resource allowing inbound HTTP traffic from anywhere.
resource "aws_security_group" "youb_server_security_group" {
  name_prefix = "youb-Server-SG-"
  vpc_id      = "your-vpc-id"

  # Ingress rule allowing HTTP traffic from any IP address.
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Resource for attaching a 10 GiB EBS volume to the EC2 instance.
resource "aws_volume_attachment" "ebs_volume_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.youb_server.id
}

# Resource for creating a 10 GiB EBS volume in the us-east-1a availability zone.
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "us-east-1a"
  size              = 10
}


# These comments provide a brief explanation of each resource and configuration block in the Terraform file. Adjust the placeholders like `ami-xxxxxxxxxxxxxxx`, `your-key-pair-name`, `your-vpc-id`, etc., with your actual values.