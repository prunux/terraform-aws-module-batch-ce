################################################################
# AWS BATCH Enviroment
################################################################

resource "aws_batch_compute_environment" "batch_compute_environment" {
  compute_environment_name = "${var.compute_environment_name}"

  compute_resources {
    instance_role = "${aws_iam_instance_profile.batch_ecs_instance_role.arn}"
    instance_type = "${var.compute_resources_instance_types}"

    bid_percentage = "${var.compute_resources_bid_percentage}"

    desired_vcpus = "${var.compute_resources_desired_vcpus}"
    max_vcpus     = "${var.compute_resources_max_vcpu}"
    min_vcpus     = "${var.compute_resources_min_vcpu}"

    security_group_ids = [
      "${aws_security_group.aws_batch_sg.id}",
      "${var.compute_resources_security_group_ids}",
    ]

    subnets = [
      "${var.compute_resources_subnet_ids}",
    ]

    type = "${var.compute_resources_type}"

    spot_iam_fleet_role = "${aws_iam_role.AmazonEC2SpotFleetRole.arn}"

    tags = "${merge(map("Name", var.compute_environment_name), var.extra_tags)}"
  }

  service_role = "${aws_iam_role.batch_service_role.arn}"
  type         = "${var.type}"

  depends_on = [
    "aws_iam_role_policy_attachment.batch_service_role",
    "aws_iam_role_policy_attachment.batch_ecs_instance_role",
    "aws_iam_role_policy_attachment.batch_ecs_task_execution_role",
    "aws_iam_role.AmazonEC2SpotFleetRole",
  ]
}
