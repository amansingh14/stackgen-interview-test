# StackGen Interview Test

This repository provisions the infrastructure and deployment configuration for the Spring Petclinic application on AWS. It includes Terraform modules to create AWS resources and Kubernetes manifests (along with a generated Helm chart) for deploying the application to an EKS cluster. GitHub Actions automate Terraform plans/applies and optional manual deployment steps.

## Repository Structure

- **terraform/** – Infrastructure as code for AWS resources such as IAM roles, KMS keys, RDS, ElastiCache and S3 buckets.
- **deployment/** – Kubernetes YAML files used to deploy the application without Helm.
- **helm/** – Generated Helm chart (not currently used for deployment).
- **.github/workflows/** – CI/CD pipelines for Terraform and manual Kubernetes deployment.

## Usage

1. Update values in `terraform/terraform.tfvars` for your environment.
2. Run Terraform to provision the infrastructure:
   ```bash
   cd terraform
   terraform init
   terraform plan
   terraform apply
   ```
3. Deploy the application to your EKS cluster using the manifests under `deployment/` or customize the Helm chart under `helm/` if desired.

## Challenges

I faced some difficulties converting the Terraform code from Azure to AWS. The Terraform documentation and AI assistance helped me resolve the issues and better understand the differences. My Helm experience is limited, so I was unable to get a full Helm deployment working. Instead, I added Kubernetes YAML configs for the deployment.