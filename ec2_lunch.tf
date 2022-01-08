provider "aws" {
    access_key = " provide_access_key"
    secret_key = " provide_secret_key"
    region = " give_region_need to lunch_ec2_instance"
    }
resource "aws_instance" "name_of_instance" {
    ami = " Ami_id "
    count = 1
    key_name = " key_name"
    instance_type = "t2.micro"
    security_group = [ "security_group_ansible"]
    tags = {
        name = "ansible_instance"
    }
}
resource "aws_security_group" "security_group_ansible"{
    name = "security_group_ansible"
    discription = "security_group_for_ansible"

# outbound from ansible server 

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
# outbound from ansible server
    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        name = "security_group_for_ansible"
    }
}













