## Lab 5: Creating a Virtual Private Cloud

### Objectives

1. Deploy a VPC
2. Create an internet gateway and attach it to the VPC
3. Create a public subnet
4. Create a private subnet
5. Create an application server to test the VPC

### Architecture Overview
At the end of this lab, your architecture will look like the following example:

![Architecture Example](https://user-images.githubusercontent.com/89054489/232357827-5b682018-5764-4deb-8fd1-b9e0c55e3c97.png)

### Duration
This lab requires approximately 45 minutes to complete.

---

### Task 1: Creating a VPC

1. **Navigate to VPC**: In the AWS Management Console, choose **VPC** from the Services menu.
2. **Create VPC**:
   - In the left navigation pane, choose **Your VPCs**.
   - Choose **Create VPC**.
   - For **Resources to create**, choose **VPC only**.
   - Configure the settings:
     - **Name tag**: Lab VPC
     - **IPv4 CIDR block**: 10.0.0.0/16
     - **Tenancy**: Default
     - **Tags**: Key: Name, Value: Lab VPC
   - Choose **Create VPC**.
3. **Enable DNS Hostnames**:
   - On the VPC Details page, choose the **Tags** tab.
   - Choose **Actions** and select **Edit VPC settings**.
   - In the DNS settings section, select **Enable DNS hostnames**.
   - Choose **Save**.

### Task 2: Creating Subnets

1. **Create a Public Subnet**:
   - In the left navigation pane, choose **Subnets**.
   - Choose **Create subnet**.
   - Configure the settings:
     - **VPC ID**: Lab VPC
     - **Subnet name**: Public Subnet
     - **Availability zone**: Select the first Availability Zone in the list.
     - **IPv4 CIDR block**: 10.0.0.0/24
   - Choose **Create subnet**.
   - Select the check box for **Public Subnet**.
   - Choose **Actions** and select **Edit subnet settings**.
   - Under **Auto-assign IP settings**, select **Enable auto-assign public IPv4 address**.
   - Choose **Save**.

2. **Create a Private Subnet**:
   - Repeat the steps above to create another subnet with the following settings:
     - **Subnet name**: Private Subnet
     - **IPv4 CIDR block**: 10.0.2.0/23

### Task 3: Creating an Internet Gateway

1. **Create Internet Gateway**:
   - In the left navigation pane, choose **Internet Gateways**.
   - Choose **Create internet gateway**.
   - Configure the settings:
     - **Name tag**: Lab IGW
   - Choose **Create internet gateway**.
2. **Attach Internet Gateway**:
   - Choose **Actions** and then **Attach to VPC**.
   - For **Available VPCs**, select **Lab VPC**.
   - Choose **Attach internet gateway**.

### Task 4: Configuring Route Tables

1. **Create a Public Route Table**:
   - In the left navigation pane, choose **Route Tables**.
   - Choose **Create route table**.
   - Configure the settings:
     - **Name**: Public Route Table
     - **VPC**: Lab VPC
   - Choose **Create route table**.
2. **Add Route to Public Route Table**:
   - In the Routes tab, choose **Edit routes**.
   - Choose **Add route**.
   - Configure the settings:
     - **Destination**: 0.0.0.0/0
     - **Target**: Internet Gateway, select **Lab IGW**
   - Choose **Save changes**.
3. **Associate Route Table with Public Subnet**:
   - Choose the **Subnet associations** tab.
   - In the Subnets without explicit associations section, choose **Edit subnet associations**.
   - Select the row with **Public Subnet**.
   - Choose **Save associations**.

### Task 5: Creating a Security Group for the Application Server

1. **Create Security Group**:
   - In the left navigation pane, choose **Security Groups**.
   - Choose **Create security group**.
   - Configure the settings:
     - **Security group name**: App-SG
     - **Description**: Allow HTTP traffic
     - **VPC**: Lab VPC
   - Choose **Create security group**.
2. **Add Inbound Rule**:
   - Choose the **Inbound Rules** tab.
   - Choose **Edit inbound rules**.
   - Choose **Add rule**.
   - Configure the settings:
     - **Type**: HTTP
     - **Source type**: Anywhere IPv4
     - **Description**: Allow web access
   - Choose **Save rules**.

### Task 6: Launching an Application Server in the Public Subnet

1. **Launch EC2 Instance**:
   - Choose **EC2** from the Services menu.
   - Choose **Launch instance**.
   - Configure the instance settings:
     - **Name**: App Server
     - **Application and OS Images**: Amazon Linux 2 (default)
     - **Instance type**: t2.micro (default)
     - **Key pair**: Proceed without a key pair (not recommended)
     - **Network settings**: Choose **Edit**.
     - **VPC**: Lab VPC
     - **Subnet**: Public Subnet
     - **Auto-assign public IP**: Enable
     - **Firewall (security groups)**: Select **App-SG**
     - **Configure storage**: Keep default
     - **Advanced details**: 
       - **IAM instance profile**: Inventory-App-Role
       - **User data**: 
         ```bash
         #!/bin/bash
         # Install Apache Web Server and PHP
         yum install -y httpd mysql
         amazon-linux-extras install -y php7.2
         # Download Lab files
         wget https://aws-tc-largeobjects.s3-us-west-2.amazonaws.com/ILT-TF-200-ACACAD-20-EN/mod6-guided/scripts/inventory-app.zip
         unzip inventory-app.zip -d /var/www/html/
         # Download and install the AWS SDK for PHP
         wget https://github.com/aws/aws-sdk-php/releases/download/3.62.3/aws.zip
         unzip aws -d /var/www/html
         # Turn on web server
         chkconfig httpd on
         service httpd start
         ```
   - Choose **Launch instance**.
2. **Verify the Instance**:
   - Choose **View all instances**.
   - Wait for the instance state to be **Running**.
   - Select **App Server**.
   - Copy the **Public IPv4 address** from the Details tab.
   - Open a new browser tab, paste the IP address, and press Enter. 

If everything is configured correctly, you should see the Inventory application with the message: "Please configure Settings to connect to database."

---

**Lab Complete**: 

Congratulations! You have successfully completed the lab.