locals {
  aws_batch_compute_env_sg = "${var.compute_environment_name}_SG"
}

resource "aws_security_group" "aws_batch_sg" {
  name        = "${local.aws_batch_compute_env_sg}"
  description = "AWS Batch Compute Environment SG"
  vpc_id      = "${var.compute_resources_vpc_id}"

  tags {
    Name = "AWS Batch Compute Environment SG"
  }
}
