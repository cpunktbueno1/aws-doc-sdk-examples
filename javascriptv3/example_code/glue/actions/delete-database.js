/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

import { DeleteDatabaseCommand, GlueClient } from "@aws-sdk/client-glue";

/** snippet-start:[javascript.v3.glue.actions.DeleteDatabase] */
const deleteDatabase = (databaseName) => {
  const client = new GlueClient({});

  const command = new DeleteDatabaseCommand({
    Name: databaseName,
  });

  return client.send(command);
};
/** snippet-end:[javascript.v3.glue.actions.DeleteDatabase] */

export { deleteDatabase };
