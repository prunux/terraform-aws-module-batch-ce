### APP 1 AWS Batch and ECS Container Description ###
resource "aws_batch_job_definition" "app-1-prod" {
  name = "app-1-prod"
  type = "container"

  timeout {
    attempt_duration_seconds = 3600
  }

  retry_strategy {
    attempts = 1
  }

  container_properties = <<CONTAINER_PROPERTIES
{
        "image": "1234567890.dkr.ecr.eu-west-1.amazonaws.com/app-1:prod",
        "vcpus": 2,
        "memory": 512,
        "command": [],
        "jobRoleArn": "arn:aws:iam::1234567890:role/batch-comp-env-prod_batch_ecs_task_execution_role",
        "volumes": [],
        "environment": [],
        "mountPoints": [],
        "ulimits": []
}
CONTAINER_PROPERTIES
}

### APP 2 AWS Batch and ECS Container Description ###
resource "aws_batch_job_definition" "app-2-prod" {
  name = "app-2-prod"
  type = "container"

  timeout {
    attempt_duration_seconds = 3600
  }

  retry_strategy {
    attempts = 1
  }

  container_properties = <<CONTAINER_PROPERTIES
{
        "image": "1234567890.dkr.ecr.eu-west-1.amazonaws.com/app-2:prod",
        "vcpus": 2,
        "memory": 512,
        "command": [],
        "jobRoleArn": "arn:aws:iam::1234567890:role/batch-comp-env-prod_batch_ecs_task_execution_role",
        "volumes": [],
        "environment": [],
        "mountPoints": [],
        "ulimits": []
}
CONTAINER_PROPERTIES
}