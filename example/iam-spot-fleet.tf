# added linked service roles
resource "aws_iam_service_linked_role" "AWSServiceRoleForEC2Spot" {
  aws_service_name = "spot.amazonaws.com"
}

resource "aws_iam_service_linked_role" "AWSServiceRoleForEC2SpotFleet" {
  aws_service_name = "spotfleet.amazonaws.com"
}
