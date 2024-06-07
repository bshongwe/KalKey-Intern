# 🌐 Kalkey Hands-On Lab: Creation of AWS EC2 Instance with Terraform

This guide provides detailed instructions on how to set up and configure an AWS EC2 instance using Terraform on an Ubuntu Linux system.

## 📋 Table of Contents
1. [🔧 Installation & Setting Up Lab](#installation--setting-up-lab)
2. [🔑 Authentication with AWS](#authentication-with-aws)
3. [👤 Creating and Configuring IAM Users](#creating-and-configuring-iam-users)
4. [🚀 Deploying Infrastructure with Terraform](#deploying-infrastructure-with-terraform)
5. [📜 Terraform Commands](#terraform-commands)

## 🔧 Installation & Setting Up Lab

### 🐧 Ubuntu Linux

Update the system and install necessary packages:

```sh
sudo apt update
sudo apt install gnupg software-properties-common curl -y
```

Download and add the HashiCorp GPG key:

```sh
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

Verify the Key’s fingerprint:

```sh
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
```

Add the HashiCorp repository:

```sh
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

Update the package list and install Terraform:

```sh
sudo apt update
sudo apt install terraform -y
```

Verify the installation:

```sh
which terraform
terraform --version
```

## 🔑 Authentication with AWS

The AWS provider in Terraform offers several methods for authentication:

1. **Static credentials**
2. **Environment variables**
3. **Shared credentials file**
4. **EC2 Role**

### Static Credentials

⚠️ **Warning:** Hard-coding credentials in your Terraform configuration is not recommended due to the risk of secret leakage if the file is committed to a public version control system.

Static credentials can be provided in the AWS provider block:

```hcl
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

## 👤 Creating and Configuring IAM Users

Follow the AWS IAM workflow to create and manage users required for your Terraform setup.

## 🚀 Deploying Infrastructure with Terraform

1. **Launch an EC2 instance** via the AWS console to manage or create the infrastructure.
2. **Install Terraform** on the instance and configure the environment path.
3. **Create Terraform configuration files** with `.tf` extension to launch an EC2 instance. These files can be written in HCL (HashiCorp Configuration Language) or JSON.

### Terraform Provider Configuration (`provider.tf`)

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = "xXXXXXXXX"
  secret_key = "xXXXXXXXXX"
}
```

### Terraform Security Group Configuration (`security_group.tf`)

```hcl
resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-c4e4ebac"
  
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_server_sg"
  }
}
```

### Terraform AWS EC2 Instance Configuration (`ec2.tf`)

```hcl
resource "aws_instance" "http_server" {
  ami                    = "ami-06292ffafe4773f6c"
  key_name               = "devops"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id              = "subnet-084434d0d9ae9ae64"

  tags = {
    Name = "http_server_instance"
  }
}
```

## 📜 Terraform Commands

Initialize and install the plugins:

```sh
terraform init
```

Validate the Terraform files:

```sh
terraform validate
```

Test the configuration files before running:

```sh
terraform plan
```

Apply and run the code mentioned inside the Terraform files:

```sh
terraform apply
```

Destroy the provisioned resources as per the Terraform state file:

```sh
terraform destroy
```

This guide should help you set up and manage an AWS EC2 instance using Terraform. Ensure you follow best practices, especially regarding credential management and version control.
