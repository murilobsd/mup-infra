# Mup Infrastructure

### Terraform

create S3 bucket for storing terraform remote state

```
REGION=us-east-1
S3_NAME=mup-terraform-state
aws s3api create-bucket --bucket $S3_NAME --region $REGION
```
