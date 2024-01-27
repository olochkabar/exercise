
#!/bin/bash

# Check if version is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <new-version>"
    exit 1
fi

NEW_VERSION=$1
BRANCH_NAME="turoapp-$NEW_VERSION"
DEPLOYMENT_FILE="deployment.auto.tfvars" # The Terraform deployment file


# Step 1: Update the Docker image version in the Terraform configuration
#this line is MacOs specific
sed -i '' "s|image = .*|image = \"olochkabar/oluapp:$NEW_VERSION\"|g" "$DEPLOYMENT_FILE"


#this line can be used on linux/windows
#sed -i "s|image = .*|image = \"olochkabar/oluapp:$NEW_VERSION\"|g" $DEPLOYMENT_FILE

# Step 2: Create and checkout to a new branch
git checkout -b $BRANCH_NAME

# sed -i "s|image = \"olochkabar/oluapp:v1\"|image = \"olochkabar/oluapp:$NEW_VERSION\"|g" $$DEPLOYMENT_FILE

# Step 3: Git Operations (Add, Commit, Push)
git add $DEPLOYMENT_FILE
git commit -m "Update application to version $NEW_VERSION"
git push oloch $BRANCH_NAME

# Step 4: Create a Pull Request
gh pr create --base main --head $BRANCH_NAME --title "Update to version $NEW_VERSION" --body "This PR updates the web app to version $NEW_VERSION."