# Auto-scaling

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

# NCore

# Auto-scaling

When dealing with fluctuations in traffic, we often need more servers than we have ready. Rather than having someone sat waiting to add and remove servers based on demand, we can set up this behaviour programmatically using Auto-scaling Groups.

In this sprint, you will be given some infrastructure that you will need to convert to use Auto-scaling Groups.

This sprint is intended to be done entirely without using the AWS console.

## 1. Can we build it? Yes we can.

Familiarise yourself with the Terraform code.

This repo uses a `terraform.tfvars` file to supply variables to the root level code which are then passed down to each of the modules.

Provision the already provided infrastructure to your account.

## 2. We can make it if we try

It's time to set up our servers

- Add a security group and rule to the security module which allows SSH connections from your IP address only. Your CIDR block should end in `/32`.
- Add a keypair to your EC2 instance block - this can be the name of one you've already created previously or you can [make a new one via the CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html).
- Add an output block to your app-server module which outputs the public DNS of your servers
  - Add an output block to you root level terraform which outputs this to your terminal when you run apply

SSH to the instance using the following command as a template

**Reminder: You'll need to be in the same directory as your key file.**

`ssh -i "KEY_NAME.pem" ubuntu@PUBLIC_DNS`

Once you have managed to connect to your instance move to the next step

## 3. Configuration

It's time to get our server up and running so we can make a template.

- Create a PAT token on GitHub and use it to clone down the [Node API from yesterdays repo](https://github.com/northcoders/ce-load-balancing-node-api)
- Install Node & NPM
- Install pm2
- Start the server with pm2

Check that the server is working by requesting the public DNS for that instance on port 3000.

## 4. I think i'm ready to go, AMI?

Until now we have been using the standard Ubuntu Amazon Machine Image (AMI) and installing what we need each time. However we can actually create our own custom AMI with all of the files already installed that we might need. This means we don't have to constantly clone new repos, install Node and pm2 again.

Create an AMI from the instance you just created

[aws_ami_from_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami_from_instance)

## 5. Ready for Launch

An AMI will contain a snapshot of the operating system and files we want to install onto the EC2 instance whereas a `launch template` allows us to choose; the instance type, the security groups, which key pair to use, whether the instance has a public DNS, etc.

This will come in handy when we want to create instances programmatically later.

Create a launch template that mirrors the properties of the EC2 resource block whilst using the new custom AMI you just created.

- [aws_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template)

Create some user-data for this launch template as well which starts the server with pm2 when the instance starts up. You'll find an example of user-data in the file user-data-example.sh

## 6. It's time to expand

Create an Autoscaling group that makes use of the launch template you just created

- [aws_autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)

Add the following lines to your `terraform.tfvars` and create the necessary blocks and links for your Autoscaling Group resource to use them:

```
min_size = 3
desired_capacity = 4
max_size = 5
```

## 7. It's all about balance

We can now spin up new servers as and when we need them but we don't want to have to send out a newsletter with the latest public DNS every time we get a new instance.

Drawing on what you learned yesterday, create a load balancer that targets your Auto-scaling Group.

- Create your Load Balancer
- Attach it to the ASG [aws_autoscaling_group_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment)

## 8. Practice makes perfect

Use this infrastructure and these instructions to create an autoscaling group using the Next application from Day 1

[ce-photo-display-app](https://github.com/northcoders/ce-photo-display-app)
