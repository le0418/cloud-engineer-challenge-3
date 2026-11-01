\## Project Overview



This project demonstrates infrastructure provisioning with Terraform and automated web server configuration with Ansible on Amazon Web Services (AWS).



Terraform provisions an EC2 instance, S3 bucket, IAM role, instance profile, and security group. Ansible connects to the EC2 instance using SSH, installs Nginx, and deploys a custom \*\*Hello, World!\*\* web page.



\## Live Application



\*\*Website:\*\* http://32.199.166.98



The application displays a Hello, World! message confirming successful deployment using Terraform and Ansible.



The public IP is assigned dynamically and may change if the instance is stopped and started.



\## Architecture



\- \*\*Cloud provider:\*\* AWS

\- \*\*Region:\*\* us-east-1

\- \*\*Compute:\*\* EC2 t3.micro running Amazon Linux 2023

\- \*\*Web server:\*\* Nginx

\- \*\*Infrastructure as Code:\*\* Terraform

\- \*\*Configuration management:\*\* Ansible

\- \*\*Storage:\*\* Amazon S3

\- \*\*Identity and access:\*\* IAM role and instance profile

\- \*\*Networking:\*\* Default VPC and subnet with a dedicated security group



Traffic flows from a web browser over HTTP port 80 to the EC2 instance running Nginx. Ansible connects over SSH port 22 to install and configure the web server.



\## Project Structure



cloud-engineer-challenge-3/

├── terraform/

│   ├── main.tf

│   ├── variables.tf

│   ├── outputs.tf

│   ├── providers.tf

│   └── terraform.tfvars.example

├── ansible/

│   ├── inventory.ini.example

│   ├── playbook.yml

│   └── files/

│       └── index.html

├── screenshots/

├── .gitignore

└── README.md



\## Prerequisites



- AWS account with permissions to provision the required resources

- AWS CLI configured with appropriate credentials

- Terraform

- Ansible

- SSH key pair available in the selected AWS region

- Git

- Linux or WSL2 environment for running Ansible



## Terraform Deployment



1\. Navigate to the `terraform` directory.

2\. Copy `terraform.tfvars.example` to `terraform.tfvars`.

3\. Configure the required variables, including a globally unique S3 bucket name, SSH key name, and authorized SSH CIDR.

4\. Initialize and validate Terraform.



bash

terraform init

terraform fmt -check

terraform validate

terraform plan -out=challenge3.tfplan

terraform apply challenge3.tfplan

terraform output




Terraform provisions eight AWS resources, including the EC2 instance, S3 bucket and its security configurations, IAM resources, and security group.



\## Ansible Configuration



1\. Navigate to the `ansible` directory.

2\. Copy `inventory.ini.example` to `inventory.ini`.

3\. Update the EC2 public IP address and local private-key path.

4\. Verify connectivity.



bash

ansible -i inventory.ini webservers -m ping


5\. Validate and execute the playbook.


bash

ansible-playbook -i inventory.ini playbook.yml --syntax-check

ansible-playbook -i inventory.ini playbook.yml



The playbook installs Nginx, deploys the HTML page, and ensures that Nginx is enabled and running.



\## Deployment Results



The Terraform deployment completed successfully:



- 8 resources added

- 0 resources changed

- 0 resources destroyed



The initial Ansible execution completed successfully:



- 5 tasks successful

- 4 changes

- 0 unreachable hosts

- 0 failed tasks



A second Ansible execution confirmed idempotency:



4 tasks successful

0 changes

0 unreachable hosts

0 failed tasks



\## Validation



The following checks were completed successfully:



- SSH access to the EC2 instance

- Ansible connectivity test returning `pong`

- Nginx service active and enabled

- Web page displaying `Hello, World!`

- HTTP response status `200`

- TCP port 80 connectivity successful



\## Security Considerations



- SSH access is restricted to an authorized source IP address.

- HTTP port 80 is publicly accessible for the demonstration.

- EC2 uses an IAM instance profile.

- EC2 instance metadata requires IMDSv2.

- The EC2 root EBS volume is encrypted.

- S3 public access blocking is enabled.

- S3 default server-side encryption and versioning are enabled.

- Terraform state files, local variable files, SSH private keys, and actual Ansible inventory files are excluded from Git.

