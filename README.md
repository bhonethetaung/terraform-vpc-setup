# VPC Creation With Terraform

**Description**
    This is the demo version of creating VPC on AWS using Terraform.

## Prerequisite
- [Terraform installed](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Destroy](#destroy)

**Project Scenario**
    User wants to create a VPC on AWS using Terraform to automate future processes and avoid manual work. The VPC will span two Availability Zones: one with three public subnets, and the other with three private subnets. Each subnet will have a different CIDR range within the same CIDR block. An Internet Gateway will also be created to enable outgoing network traffic for the public subnets. CIDR ranges and AZs can be adjusted as needed. Once the VPC is created, it's ready for use. Kudos!

## Getting Started
1. Clone the repository:
    
    ```bash
    git clone https://github.com/bhonethetaung/terraform-vpc-setup.git
    cd terraform-vpc-setup
    ```

2. Initialize the Terraform project:

    ```bash
    terraform init
    ```
3. Adjust the CIDR ranges and AZs as needed.

---

## Usage

1. **Varify the Infrastructure:**

    ```bash
    terraform plan
    ```
2. **Apply the Infrastructure:**

    ```bash
    terraform apply
    ```
**Choose AWS CLI profile you want to use**

---

<b><span style="color:red">Destroying process can not be Undo\. So check carefully before you proceed.</span></b>

## Destroy
1. **Destroying the Infrastructure**

    ```bash
    terraform destroy
    ```

