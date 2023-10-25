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

Familiarise yourself with the Terraform code.

This repo uses a `terraform.tfvars` file to supply variables to the root level code which are then passed down to each of the modules.

Once you're ready, provision the already provided infrastructure to your account.

## 1. We can make it if we try

It's time to set up our servers

- Modify the security module to allow SSH connections from your IP address only. Your CIDR block should end in `/32`.
- Modify your EC2 block to use a key pair for SSH authentication - this can be the name of one you've already created previously or you can [make a new one via the CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html).

SSH to the instance using the following command as a template

**🗒️ Note: You'll need to be in the same directory as your key file.**

`ssh -i "KEY_NAME.pem" ubuntu@PUBLIC_DNS`

Once you have managed to connect to your instance, get the Learners API from yesterday up and running on the instance.

[Node API from load balancing sprint](https://github.com/northcoders/ce-load-balancing-node-api)

Think about what packages you'll need to install to get this running.

## 2. I think i'm ready to go, AMI?

Until now we have been using the standard Ubuntu Amazon Machine Image (AMI) and installing what we need each time.

However, we can actually create our own custom AMI with all of the files already installed that we might need. This means we don't have to constantly clone new repos, install Node and pm2 again, anytime we need another server.

Create an AMI from the instance you just configured that contains all the packages you need.

[aws_ami_from_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami_from_instance)

## 3. Ready for Launch

An AMI will contain a snapshot of the operating system and files we want to install onto the EC2 instance whereas a `launch template` allows us to pre-define things such as; the instance type, the security groups, which key pair to use, whether the instance has a public DNS, etc.

This will come in handy when we want to create instances programmatically later.

Create a launch template that mirrors the properties of the EC2 resource block whilst using the new custom AMI you just created.

- [aws_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template)

User Data allows us to run commands when the a new server starts up.

Add some user data to your launch template, consider what commands you need to add to get a new server running.

You'll find an example of user-data in the file user-data-example.sh

## 4. It's time to expand

Create an Autoscaling group (ASG) that makes use of the launch template you just created

- [aws_autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)

Add some variables to your `terraform.tfvars` and create the necessary blocks and links for your Autoscaling Group resource to use them.

You should have variables that allow us to configure the ASG to control;

- the minimum amount of instances
- the desired amount of instances
- the maximum amount of instances

## 5. It's all about balance

We can now spin up new servers as and when we need them but we don't want to have to send out a newsletter with the latest public DNS every time we get a new instance.

Drawing on what you learned yesterday, create a load balancer that targets your Auto-scaling Group.

- Create your Load Balancer
- Attach it to the ASG [aws_autoscaling_group_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment)

## 6. Practice makes perfect

Using what you've learned, get the [ce-smart-home](https://github.com/northcoders/ce-smart-home-status) services deployed with an ASG and Load balancer.

You can use something like Insomnia, Postman, or ThunderClient to test out your services once hosted.
