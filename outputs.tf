output "compute_environment_arn" {
  description = "The arn of the compute environment"
  value       = "${aws_batch_compute_environment.batch_compute_environment.arn}"
}

output "batch_ecs_task_execution_role_name" {
  description = "The name of the Batch ECSTaskExecutionRole"
  value       = "${aws_iam_role.batch_ecs_task_execution_role.name}"
}
