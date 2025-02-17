# Amazon SQS code examples for the SDK for C++

## Overview

Shows how to use the AWS SDK for C++ to work with Amazon Simple Queue Service (Amazon SQS).

<!--custom.overview.start-->
<!--custom.overview.end-->

_Amazon SQS is a fully managed message queuing service that makes it easy to decouple and scale microservices, distributed systems, and serverless applications._

## ⚠ Important

* Running this code might result in charges to your AWS account. For more details, see [AWS Pricing](https://aws.amazon.com/pricing/) and [Free Tier](https://aws.amazon.com/free/).
* Running the tests might result in charges to your AWS account.
* We recommend that you grant your code least privilege. At most, grant only the minimum permissions required to perform the task. For more information, see [Grant least privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege).
* This code is not tested in every AWS Region. For more information, see [AWS Regional Services](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services).

<!--custom.important.start-->
<!--custom.important.end-->

## Code examples

### Prerequisites



Before using the code examples, first complete the installation and setup steps
for [Getting started](https://docs.aws.amazon.com/sdk-for-cpp/v1/developer-guide/getting-started.html) in the AWS SDK for
C++ Developer Guide.
This section covers how to get and build the SDK, and how to build your own code by using the SDK with a
sample Hello World-style application.

Next, for information on code example structures and how to build and run the examples, see [Getting started with the AWS SDK for C++ code examples](https://docs.aws.amazon.com/sdk-for-cpp/v1/developer-guide/getting-started-code-examples.html).


<!--custom.prerequisites.start-->
<!--custom.prerequisites.end-->

### Get started

- [Hello Amazon SQS](hello_sqs/CMakeLists.txt#L4) (`ListQueues`)


### Single actions

Code excerpts that show you how to call individual service functions.

- [Change how long a queue waits for a message](long_polling_on_existing_queue.cpp#L87) (`SetQueueAttributes`)
- [Change message timeout visibility](change_message_visibility.cpp#L26) (`ChangeMessageVisibility`)
- [Configure a dead-letter queue](dead_letter_queue.cpp#L123) (`SetQueueAttributes`)
- [Create a queue](create_queue.cpp#L25) (`CreateQueue`)
- [Delete a batch of messages from a queue](../cross-service/topics_and_queues/messaging_with_topics_and_queues.cpp#L646) (`DeleteMessageBatch`)
- [Delete a message from a queue](delete_message.cpp#L25) (`DeleteMessage`)
- [Delete a queue](delete_queue.cpp#L26) (`DeleteQueue`)
- [Get attributes for a queue](../cross-service/topics_and_queues/messaging_with_topics_and_queues.cpp#L382) (`GetQueueAttributes`)
- [Get the URL of a queue](get_queue_url.cpp#L25) (`GetQueueUrl`)
- [List queues](list_queues.cpp#L25) (`ListQueues`)
- [Receive messages from a queue](receive_message.cpp#L25) (`ReceiveMessage`)
- [Send a message to a queue](send_message.cpp#L25) (`SendMessage`)
- [Set queue attributes](set_queue_attributes.cpp#L23) (`SetQueueAttributes`)

### Scenarios

Code examples that show you how to accomplish a specific task by calling multiple
functions within the same service.

- [Publish messages to queues](../cross-service/topics_and_queues/messaging_with_topics_and_queues.cpp)


<!--custom.examples.start-->
<!--custom.examples.end-->

## Run the examples

### Instructions

An executable is built for each source file. These executables are located in the build folder and have
"run_" prepended to the source file name, minus the suffix. See the "main" function in the source file for further instructions.

For example, to run the action in the source file "my_action.cpp", execute the following command from within the build folder. The command
will display any required arguments.

```
./run_my_action
```

<!--custom.instructions.start-->
<!--custom.instructions.end-->

#### Hello Amazon SQS

This example shows you how to get started using Amazon SQS.



#### Publish messages to queues

This example shows you how to do the following:

- Create topic (FIFO or non-FIFO).
- Subscribe several queues to the topic with an option to apply a filter.
- Publish messages to the topic.
- Poll the queues for messages received.

<!--custom.scenario_prereqs.sqs_Scenario_TopicsAndQueues.start-->
<!--custom.scenario_prereqs.sqs_Scenario_TopicsAndQueues.end-->


<!--custom.scenarios.sqs_Scenario_TopicsAndQueues.start-->
<!--custom.scenarios.sqs_Scenario_TopicsAndQueues.end-->

### Tests

⚠ Running tests might result in charges to your AWS account.



```sh
   cd <BUILD_DIR>
   cmake <path-to-root-of-this-source-code> -DBUILD_TESTS=ON
   make
   ctest
```


<!--custom.tests.start-->
<!--custom.tests.end-->

## Additional resources

- [Amazon SQS Developer Guide](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html)
- [Amazon SQS API Reference](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/Welcome.html)
- [SDK for C++ Amazon SQS reference](https://sdk.amazonaws.com/cpp/api/LATEST/aws-cpp-sdk-sqs/html/annotated.html)

<!--custom.resources.start-->
<!--custom.resources.end-->

---

Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.

SPDX-License-Identifier: Apache-2.0