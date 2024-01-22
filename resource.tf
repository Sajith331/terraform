resource "aws_instance" "sajith" {
tags = {
Name= var.iname
}
ami = var.iami
instance_type = var.itype
root_block_device {
volume_size= var.ivolume
}
vpc_security_group_ids = [aws_security_group.ameer.id]
availability_zone= var.izone
}
