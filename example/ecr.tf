resource "aws_ecr_repository" "container-app-1" {
  name = "container-app-1"
}

resource "aws_ecr_repository" "container-app-2" {
  name = "container-app-2"
}

## technical user to modify / upload / tag the images ###
resource "aws_iam_user" "my-cust-ecr-modifier" {
  name = "my-cust-ecr-modifier"
}

resource "aws_iam_user_policy_attachment" "my-cust-ecr-modifier-eCR-poweruser" {
  user       = "${aws_iam_user.my-cust-ecr-modifier.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_user_policy_attachment" "my-cust-ecr-modifier-batch-full" {
  user       = "${aws_iam_user.my-cust-ecr-modifier.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSBatchFullAccess"
}

resource "aws_iam_access_key" "my-cust-ecr-modifier" {
  user = "${aws_iam_user.my-cust-ecr-modifier.name}"
}

output "my-cust-ecr-modifier_id" {
  value = "${aws_iam_access_key.my-cust-ecr-modifier.id}"
}

output "my-cust-ecr-modifier_secret" {
  value = "${aws_iam_access_key.my-cust-ecr-modifier.secret}"
}