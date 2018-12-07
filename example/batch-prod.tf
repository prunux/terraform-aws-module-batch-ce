module "batch-comp-env-prod" {
  source = "git::ssh://git@gitlab.com/rplessl-terraform-aws-modules/batch-ce.git?ref=v1.0.0"

  compute_environment_name = "batch-comp-env-prod"

  compute_resources_instance_types = [
    "m5",
    "m4",
    "optimal",
  ]

  compute_resources_bid_percentage = 20
  compute_resources_desired_vcpus  = 4
  compute_resources_max_vcpu       = 8
  compute_resources_min_vcpu       = 2

  compute_resources_security_group_ids = [
    "${module.vpc_prod.security_group_prunux_mgt_id}",
    "${module.vpc_prod.security_group_default_id}",
  ]

  compute_resources_subnet_ids = [
    "${module.vpc_prod.subnet_prunux_mgt_public_ids}",
  ]

  compute_resources_vpc_id = "${module.vpc_prod.vpc_id}"

  compute_resources_type = "SPOT"

  type = "MANAGED"

  extra_tags = {
    Environment = "ECS Yolo OPS"
    Customer    = "${var.customer}"
    Account_ID  = "${var.account_id}"
  }
}

resource "aws_batch_job_queue" "standard-prod" {
  name                 = "standard-prod"
  state                = "ENABLED"
  priority             = 100
  compute_environments = ["${module.batch-comp-env-prod.arn}"]
}
