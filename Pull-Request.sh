
#!/bin/bash

# To take version as input
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <new-version>"
    exit 1
fi

NEW_VERSION=$1
FEATURE_BRANCH="turoapp-$NEW_VERSION"
#DEPLOYMENT_FILE="deployment.auto.tfvars"
DEPLOYMENT_FILE="Terraform-Config-File/deployment.tf"
REPO="olochkabar/exercise" 
TARGET_BRANCH="main"
PR_TITLE="Update to version $NEW_VERSION" 
PR_BODY="This PR updates the app to version $NEW_VERSION."


# Step 1: Update the Docker image version in the Terraform configuration
sed -i '' "s|image = .*|image = \"olochkabar/turoapp:$NEW_VERSION\"|g" "$DEPLOYMENT_FILE"


# Step 2: Create and checkout to a new branch
git checkout -b $FEATURE_BRANCH

# Step 3: Git Operations (Add, Commit, Push)
git add $DEPLOYMENT_FILE
git commit -m "update application to version $NEW_VERSION"
git push oloch $FEATURE_BRANCH

# Step 4: Create a Pull Request
gh pr create --repo $REPO --base $TARGET_BRANCH --head $FEATURE_BRANCH --title "$PR_TITLE" --body "$PR_BODY" 