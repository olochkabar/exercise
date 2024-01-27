#!/bin/bash

# Set variables
VERSION=$1

# Update Terraform script with the new version
sed -i "s|image = \".*\"|image = \"olochkabar/nginx:$VERSION\"|" turo1/deployment.tf

# Create a new branch
git checkout -b update_version_$VERSION

# Commit changes
git add turo1/deployment.tf
git commit -m "Update version to $VERSION"

# Push the branch to origin
git push oloch update_version_$VERSION

# Create a pull request (you need to replace <repo> with your actual repository)
hub pull-request -b main -h update_version_$VERSION -m "Update version to $VERSION" 


# Update Terraform code
sed -i "s|image = \"olochkabar/nginx:v1\"|image = \"olochkabar/nginx:${version}\"|" turo1/deployment.tf

# Create PR 
gh pr create --base main --head feature/update-version --title "Update app version to ${version}"
