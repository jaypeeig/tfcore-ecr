variable "name" {
  description = "The name of your stack, e.g. 'demo'"
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. (MUTABLE or IMMUTABLE)"
  default     = "IMMUTABLE"
  type        = string
}

variable "force_delete" {
  description = "A boolean indicating whether to force deletion of the repository"
  default     = true
  type        = bool
}

variable "scan_on_push" {
  description = "A boolean indicating whether images are scanned on push"
  default     = true
  type        = bool
}

variable "lifecycle_policy_text" {
  description = "The lifecycle policy text to apply to the repository"
  type        = string
  default     = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Expire images older than 30 days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 30
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

variable "tags" {
  description = "A map of tags to add to the ECR repository"
  type        = map(string)
  default = {
    "Environment" =  "dev"
    "Name"        = "ecr"
  }
}