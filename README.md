# Launch templates and Auto scaling

Up to this point, you have covered aspects on designing for failure.

When utilising cloud technologies, we have to acknowledge that our responses to failure have to be re-thought. Such as us not being able to physically go and touch or restart the actual server. We may not even have direct phone call access to the people (EG. AWS employees) who look after our servers.

So we need to re-think how we architect systems.

You have made great progress on this utilising things like:

* A load balancer that has health check capabilities. Not only will it balance load across different servers it also health checks the instance before sending traffic to it so without human intervention it will stop sending traffic to failing nodes

* You want to avoid a scenario in which servers are configured incorrectly such as them having the wrong versions of node installed so you templated/automated this by creating an AMI image of your servers that ensures all servers have node and npm installed.


🗒️ Side-Note: If you didn't have this level of consistency across your servers but instead you relied on humans to configure them and those humans could install different versions of node, or forget to intall certain tools then you might experience [Snowflake servers](https://martinfowler.com/bliki/SnowflakeServer.html)

There is another section that we can automate - can you guess what it is? Have a think about what you are still manually having to do before looking over the scenario

## Scenario

Even though you have used a template for your instances, the Amazon Machine image, you notice that you still have to manually provision the EC2 instance when you need one.

Also, let's assume that we need a minimum of 2 instances to have a good service for our customers - what do you do if an instance fails? You have to first spot it and then manually launch another EC2 instance in its place.

It would be great that some level of automation ensures that a minimum of two instances are always running 

You are the amazing cloud engineer that is going to sort this 😍

## Pre-requisites

- You have completed the [load balancing exercise](https://github.com/northcoders/ce-load-balancing-node-api)

- You have completed the [AMI exercise](https://github.com/northcoders/ce-ami-image-creation)

## Instructions

The instructions for this one will be less prescriptive. Instead we'll provide some pointers to AWS services and tools that can help you on your journey

- Take a look over [AWS Auto scaling groups](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-launch-template.html)

- To use an auto-scaling group you'll need a [launch template](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html)

- To make use of the launch template, you'll need to have understood the concept of user data and running scripts when your instance starts. This was covered in the [Extension exercise](https://github.com/northcoders/ce-ami-image-creation#extension) of the AMI creation task. You can apply user data to launch templates.

## Tearing things down

1. Remove your auto scaling group

2. Remove your load balancer

3. Terminate any EC2 instances


## Submission process

For this one you will be recording yourself on Zoom talking through what you have setup - 10 mins max

It's worth doing a short test run to test your Zoom and recording setup before committing to the final recording.

Do not worry at all about verbal mistakes or explaining things incorrectly then having to go back. Your presenting skills are not the focus right now 😊


1. Start up a zoom call that has only yourself in it

2. Share your screen

3. Turn on recording on Zoom

4. Record a short video that includes
    - You talking through what you have setup so far on AWS and explaining back what those pieces do
    - A demonstration of the auto scaling groups working
        - You can demonstrate this by going to the EC2 section and manually terminating an instance then without clicking anything further (other than refresh) you should see your auto-scaling group kick into action and bring a new instance online
        - You can also show that your API remains to be working even after terminating an instance

5. End the Zoom call and you will receive a message regarding your video being processed. Once complete it will save a video to your computer.

6. Share the video with your coach as indicated

7. Complete the "Tearing things down" instructions

## Further reading

[Snowflake servers](https://martinfowler.com/bliki/SnowflakeServer.html)

[AWS Auto scaling group guide](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-launch-template.html)

[AWS Launch Template guide](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html)

