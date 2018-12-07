### AWS Batch Specifica ###
variable "compute_environment_name" {
  type        = "string"
  description = "The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, and underscores are allowed. "
}

variable "compute_resources_instance_types" {
  type        = "list"
  description = "A list of instance types that may be launched. "
  default     = ["t2.micro"]
}

variable "compute_resources_bid_percentage" {
  type        = "string"
  description = "Integer of minimum percentage that a Spot Instance price must be when compared with the On-Demand price for that instance type before instances are launched. For example, if your bid percentage is 20% (20), then the Spot price must be below 20% of the current On-Demand price for that EC2 instance. This parameter is required for SPOT compute environments."
  default     = "20"
}

variable "compute_resources_desired_vcpus" {
  type        = "string"
  description = "The desired number of EC2 vCPUS in the compute environment."
  default     = 2
}

variable "compute_resources_max_vcpu" {
  type        = "string"
  description = "The maximum number of EC2 vCPUs that an environment can reach."
  default     = 16
}

variable "compute_resources_min_vcpu" {
  type        = "string"
  description = "The minimum number of EC2 vCPUs that an environment should maintain."
  default     = 0
}

variable "compute_resources_security_group_ids" {
  type        = "list"
  description = "A list of EC2 security group that are associated with instances launched in the compute environment."
}

variable "compute_resources_subnet_ids" {
  type        = "list"
  description = "A list of VPC subnets into which the compute resources are launched."
}

variable "compute_resources_vpc_id" {
  type        = "string"
  description = "An VPC ID of the Subnet IDs."
}

variable "compute_resources_type" {
  type        = "string"
  description = "The type of compute environment. Valid items are EC2 or SPOT."
  default     = "SPOT"
}

variable "type" {
  type        = "string"
  description = "The type of the compute environment. Valid items are MANAGED or UNMANAGED. Default: MANAGED"
  default     = "MANAGED"
}

### Extra Tags ###

variable "extra_tags" {
  type        = "map"
  description = "A map of additional tags to add to the AWS Batch Compute Environment Instances. Each element in the map must have the key = value format"

  # example:
  # extra_tags = {
  #   "Environment" = "Dev",
  #   "Squad" = "Ops"  
  # }

  default = {}
}
