#!/bin/bash

# Update the system
sudo yum update -y

# Install necessary tools
sudo yum install -y unzip curl wget

# Install Terraform
TERRAFORM_VERSION="1.5.6"
echo "Installing Terraform v$TERRAFORM_VERSION..."
curl -O https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Verify Terraform Installation
terraform -v

# Install AWS CLI v2
AWS_CLI_ZIP="awscliv2.zip"
echo "Installing AWS CLI v2..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$AWS_CLI_ZIP"
unzip $AWS_CLI_ZIP
sudo ./aws/install
rm -rf $AWS_CLI_ZIP aws/

# Verify AWS CLI Installation
aws --version

echo "Terraform and AWS CLI v2 installation completed successfully."
