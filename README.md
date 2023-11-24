# Auto-scaling

## L2C

Find the L2C link [here](https://l2c.northcoders.com/courses/ce-provisioning/autoscaling)

This Terraform code when applied will create;

- A VPC
- 3 Public Subnets
- 3 Private Subnets
- Security rules which allow
  - HTTP from anywhere
  - HTTPS from anywhere
  - All egress
- An EC2 instance

The `terraform.tfvars` file provided will supply some of these arguments and can be changed or updated if necessary.
