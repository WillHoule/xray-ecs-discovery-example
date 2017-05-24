# xray-ecs-discovery-example 

Example project that uses X-Ray and SSM Parameter store.

The X-Ray container is run as a standalone daemon, and outputs its IP (assigned by the Docker0 bridge network) to the Parameter store.
Which can then be consumed by separate application containers, and exported into their environment at run time - which allows them to communicate with the X-Ray daemon.

## Installation

Either use the pre-built images (link to public repo here), or built manually from this repository.

## Usage

Launch the daemon in your ECS cluster (running it as a service, with the 'one task per host' placement template would give you the most 'daemon-like' behavior). When the example application container is launched, it should pull the daemon's IP from the SSM Parameter store, and HTTP requests against the container should begin showing up in the X-Ray console

*IAM Roles*

* X-Ray task will need to be run with a task IAM Role, and permissions to create/write to the SSM Parameter store 
  * X-Ray Permissions - https://docs.aws.amazon.com/xray/latest/devguide/xray-permissions.html
  * SSM Parameters Permissions - https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-access.html
  * IAM Roles for Tasks - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html
* Application Task will need to be launched with a task IAM role with read access to SSM Parameters.
