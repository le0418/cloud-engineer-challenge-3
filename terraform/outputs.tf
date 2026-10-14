output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web_server.id
}

output "public_ip" {
  description = "Public IP address of EC2"
  value       = aws_instance.web_server.public_ip
}

output "website_url" {
  description = "Public web page URL"
  value       = "http://${aws_instance.web_server.public_ip}"
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.challenge_bucket.id
}

output "security_group_id" {
  description = "Web server security group ID"
  value       = aws_security_group.web_sg.id
}

output "iam_role_name" {
  description = "EC2 IAM role"
  value       = aws_iam_role.ec2_role.name
}