aws dynamodb create-table ^
    --table-name Items ^
    --attribute-definitions AttributeName=id,AttributeType=N ^
    --key-schema AttributeName=id,KeyType=HASH ^
    --global-secondary-indexes ^
        "IndexName=idIndex,KeySchema=[{AttributeName=id,KeyType=HASH}],Projection={ProjectionType=ALL},ProvisionedThroughput={ReadCapacityUnits=5,WriteCapacityUnits=10}" ^
    --provisioned-throughput ReadCapacityUnits=10,WriteCapacityUnits=10



aws cognito-identity create-identity-pool --identity-pool-name ExampleIdentityPool --allow-unauthenticated-identities --region us-east-1 --output json


aws iam create-role --role-name CognitoDefaultUnauthenticatedRoleABBF7267 ^
  --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{"Effect": "Allow","Principal": {"Federated": "cognito-identity.amazonaws.com"},"Action":"sts:AssumeRoleWithWebIdentity","Condition": {"StringEquals": {"cognito-identity.amazonaws.com:aud": "{\"Ref\": \"ExampleIdentityPool\" }'"},"ForAnyValue:StringLike": {"cognito-identity.amazonaws.com:amr": "unauthenticated"}}}]}'

aws iam create-role --role-name CognitoDefaultUnauthenticatedRoleABBF7267 ^
  --assume-role-policy-document "{\"Version\": \"2012-10-17\",\"Statement\": [{\"Effect\": \"Allow\",\"Principal\": {\"Federated\": \"cognito-identity.amazonaws.com\"},\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\": {\"StringEquals\": {\"cognito-identity.amazonaws.com:aud\": \"{\\"Ref\\":\\"ExampleIdentityPool\\"}\"},\"ForAnyValue:StringLike\": {\"cognito-identity.amazonaws.com:amr\": \"unauthenticated\"} }}]}"

aws iam create-role --role-name CognitoDefaultUnauthenticatedRoleABBF7267 ^
  --assume-role-policy-document "{\"Version\": \"2012-10-17\",\"Statement\": [{\"Effect\": \"Allow\",\"Principal\": {\"Federated\": \"cognito-identity.amazonaws.com\"},\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\": {\"cognito-identity.amazonaws.com:aud\": \"{\\\"Ref\\\":\\\"ExampleIdentityPool\\\"}\"},\"ForAnyValue:StringLike\": {\"cognito-identity.amazonaws.com:amr\": \"unauthenticated\"}}}]}"

CognitoDefaultUnauthenticatedRoleABBF7267:
    Type: AWS::IAM::Role
    Properties:
      AssumeRolePolicyDocument:
        Statement:
          - Action: sts:AssumeRoleWithWebIdentity
            Condition:
              StringEquals:
                cognito-identity.amazonaws.com:aud:
                  Ref: ExampleIdentityPool
              ForAnyValue:StringLike:
                cognito-identity.amazonaws.com:amr: unauthenticated
            Effect: Allow
            Principal:
              Federated: cognito-identity.amazonaws.com
        Version: "2012-10-17"
    Metadata:
      aws:cdk:path: SetupStack/CognitoDefaultUnauthenticatedRole/Resource
  CognitoDefaultUnauthenticatedRoleDefaultPolicy2B700C08:
    Type: AWS::IAM::Policy
    Properties:
      PolicyDocument:
        Statement:
          - Action:
              - mobileanalytics:PutEvents
              - cognito-sync:*
            Effect: Allow
            Resource: "*"
          - Action: sns:Publish
            Effect: Allow
            Resource: "*"
          - Action: dynamodb:PutItem
            Effect: Allow
            Resource: "*"
        Version: "2012-10-17"
      PolicyName: CognitoDefaultUnauthenticatedRoleDefaultPolicy2B700C08
      Roles:
        - Ref: CognitoDefaultUnauthenticatedRoleABBF7267
    Metadata:
      aws:cdk:path: SetupStack/CognitoDefaultUnauthenticatedRole/DefaultPolicy/Resource
  DefaultValid:
    Type: AWS::Cognito::IdentityPoolRoleAttachment
    Properties:
      IdentityPoolId:
        Ref: ExampleIdentityPool
      Roles:
        unauthenticated:
          Fn::GetAtt:
            - CognitoDefaultUnauthenticatedRoleABBF7267
            - Arn
    Metadata:
      aws:cdk:path: SetupStack/DefaultValid
  CDKMetadata:
    Type: AWS::CDK::Metadata
    Properties:
      Analytics: v2:deflate64:H4sIAAAAAAAACl1PzQ7CIAx+Fu+s2xIT402zkyeX6QswQGUOakbRLIR3F7aL8fT9NV/bGupqD9XmwD+uEPJZBoGTgnAhLp6sUw79JBRrbvbs6eWJNWgdTV5Q9n7zFEhNGm1kuSvI2XKDsodw5f24jCwkMoF3qwkhJOsklSVNc4s4sj/d4aiOlA55mGRGprmBkM1ldcYWRy3mLFcWY2QWpYLBle96C7v02eC0LiafWo2CbsUv6QwnVvYAAAA=
    Metadata:
      aws:cdk:path: SetupStack/CDKMetadata/Default
    Condition: CDKMetadataAvailable