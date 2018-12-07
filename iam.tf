locals {
  batch_ecs_instance_role       = "${var.compute_environment_name}_batch_ecs_instance_role"
  batch_ecs_task_execution_role = "${var.compute_environment_name}_batch_ecs_task_execution_role"
  batch_service_role            = "${var.compute_environment_name}_batch_service_role"
  AmazonEC2SpotFleetRole        = "${var.compute_environment_name}_AmazonEC2SpotFleetRole"
}

### ECS Instance Role, Policy and Profile ###
resource "aws_iam_role" "batch_ecs_instance_role" {
  name = "${local.batch_ecs_instance_role}"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        }
    }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "batch_ecs_instance_role" {
  role       = "${aws_iam_role.batch_ecs_instance_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "batch_ecs_instance_role" {
  name = "${local.batch_ecs_instance_role}"
  role = "${aws_iam_role.batch_ecs_instance_role.name}"
}

### ECS Task Execution Role, Policy and Profile ###
resource "aws_iam_role" "batch_ecs_task_execution_role" {
  name = "${local.batch_ecs_task_execution_role}"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "ecs-tasks.amazonaws.com"
        }
    }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "batch_ecs_task_execution_role" {
  role       = "${aws_iam_role.batch_ecs_task_execution_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_instance_profile" "batch_ecs_task_execution_role" {
  name = "${local.batch_ecs_task_execution_role}"
  role = "${aws_iam_role.batch_ecs_task_execution_role.name}"
}

### AWS BATCH Service Role ###
resource "aws_iam_role" "batch_service_role" {
  name = "${local.batch_service_role}"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "batch.amazonaws.com"
        }
    }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "batch_service_role" {
  role       = "${aws_iam_role.batch_service_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

### For Spot Instances Fleet Roles are necessary, see also
# https://docs.aws.amazon.com/batch/latest/userguide/spot_fleet_IAM_role.html

## AmazonEC2SpotFleetRole ###
resource "aws_iam_role" "AmazonEC2SpotFleetRole" {
  name = "${local.AmazonEC2SpotFleetRole}"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "spotfleet.amazonaws.com"
        }
    }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmazonEC2SpotFleetRole" {
  role       = "${aws_iam_role.AmazonEC2SpotFleetRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole"
}
