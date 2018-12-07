# AWS Batch Environment with Spot or EC2 instances
This module creates an AWS Batch Environment with Spot or EC2 Instances.


## Minimal Example 
Create an AWS Batch Compute Environment:

```terraform
module "my-aws-batch-compute-environment" {
  source = "git::ssh://git@gitlab.nine.ch/infra/terraform-aws-modules/batch.git?ref=v1.0.0"

  compute_environment_name = "my-aws-batch-compute-environment"

  compute_resources_instance_types = [
    "m5",
    "m4",
  ]

  compute_resources_bid_percentage = 20
  compute_resources_desired_vcpus  = 4
  compute_resources_max_vcpu       = 8
  compute_resources_min_vcpu       = 2
  
  compute_resources_security_group_ids = [ "${aws_security_group.sample.id}" ]
  compute_resources_subnet_ids         = [ "${aws_subnet.sample.id}" ]
  
  compute_resources_vpc_id = "${aws_vpc.sample.id}"

  compute_resources_type = "SPOT"

  type = "MANAGED"

  extra_tags = {
    "Environment" = "Dev",
    "Squad"       = "Ops"  
  }
}
```

## Working Example

See Terraform files in the example folder

