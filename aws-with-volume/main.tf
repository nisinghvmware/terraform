provider "aws" {
    region="us-east-1"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.micro"
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.volume1.id}"
  instance_id = "${aws_instance.machine1.id}"
}
resource "aws_ebs_volume" "volume1" {
  availability_zone = "us-east-1a"
  size              = 1
}

resource "aws_instance" "machine1" {
    ami           = "ami-0b91a410940e82c54"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"    
}
