#!/bin/bash

# Get a list of IAM users
users=$(aws iam list-users --query "Users[].UserName" --output json)

# Iterate through each user
for user in $(echo "${users}" | jq -r '.[]'); do
    echo "User: ${user}"

    # Get a list of attached policies for each user
    policies=$(aws iam list-attached-user-policies --user-name "${user}" --query "AttachedPolicies[].PolicyName" --output json)

    # Output policies in JSON format
    echo "Policies: ${policies}"
    echo ""
done
