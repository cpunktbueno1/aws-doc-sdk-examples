/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

import { GlueClient, StartJobRunCommand } from "@aws-sdk/client-glue";

/** snippet-start:[javascript.v3.glue.actions.StartJobRun] */
const startJobRun = (jobName, dbName, tableName, bucketName) => {
  const client = new GlueClient({});

  const command = new StartJobRunCommand({
    JobName: jobName,
    Arguments: {
      "--input_database": dbName,
      "--input_table": tableName,
      "--output_bucket_url": `s3://${bucketName}/`,
    },
  });

  return client.send(command);
};
/** snippet-end:[javascript.v3.glue.actions.StartJobRun] */

export { startJobRun };
