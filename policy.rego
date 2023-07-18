package main

deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_ecr_repository"

    not resource.change.after.image_scanning_configuration[0].scan_on_push
    msg := "ECR Repository should have image scan on push enabled"
}

deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_ecr_repository"
    
    resource.change.after.image_tag_mutability == "MUTABLE"
    msg := "ECR Repository should have image tag mutability set to IMMUTABLE by default"
}