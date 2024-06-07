## Creating a Virtual Private Cloud

### Overview
Creating traditional networking is difficult. It involves equipments, cabling, complex configuration, and spacialist skills. Amazon Virtual Private Cloud(Amazon VPC) hides the complexity and simplifies the deployment of secure private networks.

   - In this project, we will 
      - Create our own Virtual Private Cloud (VPC).
      - Deploy Resources.
      - Create Private Peering Connection between VPCs.
### Objectives

After completing this project, we will learn how to: 

1. Deploy a VPC
2. Create an internet gateway and attach it to the VPC
3. Create a public subnet
4. Create a private subnet
5. Create an application server to test the VPC

### Architecture Overview
      At the end of this project, our architecture will look like the following diagram:

![Architecture Example](https://user-images.githubusercontent.com/89054489/232357827-5b682018-5764-4deb-8fd1-b9e0c55e3c97.png)

---

### Task 1: Creating a VPC

   A VPC is a virtual network that is dedicated to our Amazon Web Services (AWS) account. It is logically isolated from other virtual networksin the AWS cloud. We can launch AWS resources, such as Amazon Elastic Compute Cloud (Amazon EC2) instance, into the VPC. We can configure the VPC by modifying its ip address range and can create subnets. we can also configure route table, network gateway, and security settings.

1. **Navigate to VPC**: In the AWS Management Console, choose **VPC** from the Services menu.
2. **Create VPC**: A default VPC is provided so that we can launch resources as soon as we start using AWS. There is also a shared VPC that we will use later in this project. However we can create our own VPC.

   The VPC will have a CLassless Inter-Domain Routing (CIDR) range 10.0.0.0/16, which include all IP address that starts with 10.0.x.x. It contains more than 65,000 addresses. Later we will devide these addresses into separate subnets.

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

      Tags are useful for identifying resources. For example, we can use a tag to identify cost centers or different environments (such as development, test, or production).

   - Choose **Actions** and select **Edit VPC settings**.
   - In the DNS settings section, select **Enable DNS hostnames**.

      This option assigns a friendly Domain Name System (DNS) name to EC2 instances in the VPC, such as the following: ec2-52-42-133-255.us-east-1.compute.amazonaws.com

   - Choose **Save**.

   Any EC2 instances that are launched into the VPC now automatically receive a DNS hostname. We can also add a more-meaningful DNS name (such as app.example.com) later by using Amazon Route 53.


**Images for Reference**

![](https://user-images.githubusercontent.com/89054489/232374427-404f31cd-a6a6-4539-9c04-e9b941a31335.png)
![](https://user-images.githubusercontent.com/89054489/232375047-06d48d2f-5437-4b99-866e-0fb04a9d6068.png)
![](https://user-images.githubusercontent.com/89054489/232375255-eae5ed2c-82ce-43ff-913c-fd94a4925f79.png)
![](https://user-images.githubusercontent.com/89054489/232375410-d04e8f13-9c8c-462a-ae18-6a00a2e75436.png)
![](https://user-images.githubusercontent.com/89054489/232375544-7686adc1-98f5-42d5-b9f8-0ccea94fb481.png)

---

### Task 2: Creating Subnets
A subnet is a subrange of IP addresses in the VPC .AWS resources can be launched into a specific subnet. Use a public subnet for resources that must be connected to the internet, and use a private subnet for resources that must remain isolated from the internet,such as application source codes etc.

      In this task we will create a public subnet and a private subnet:

![](https://user-images.githubusercontent.com/89054489/232357859-cb473d52-489b-4dab-9ad4-80d0a829a52b.png)

1. **Create a Public Subnet** : We can use the public subnet for internet-facing resources.
   - In the left navigation pane, choose **Subnets**.
   - Choose **Create subnet**.
   - Configure the settings:
     - **VPC ID**: Lab VPC
     - **Subnet name**: Public Subnet
     - **Availability zone**: Select the first Availability Zone in the list.
     - **IPv4 CIDR block**: 10.0.0.0/24
   - Choose **Create subnet**.

   The VPC has a CIDR block of 10.0.0.0/16, which includes all 10.0.x.x IP addresses. The subnet we just created has a CIDR block of 10.0.0.0/24, which includes all 10.0.0.x IP addresses. They might look similar, but the subnet is smaller than the VPC because of the /24 in the CIDR range.

Now configure the subnet to automatically assign a public IP address for all instances that are launched in it.

   - Select the check box for **Public Subnet**.
   - Choose **Actions** and select **Edit subnet settings**.
   - Under **Auto-assign IP settings**, select **Enable auto-assign public IPv4 address**.
   - Choose **Save**.

   Though this subnet is named Public Subnet, it is not yet public. A public subnet must have an internet gateway, which we will attach in the next task.

2. **Create a Private Subnet** :   
   We  use the private subnet for resources that must remain isolated from the internet.
   - Repeat the steps above to create another subnet with the following settings:
     - **Subnet name**: Private Subnet
     - **IPv4 CIDR block**: 10.0.2.0/23

The CIDR block of 10.0.2.0/23 includes all IP addresses that start with 10.0.2.x and 10.0.3.x. This is twice as large as the public subnet because most resources should be kept private unless they specifically must be accessible from the internet.

The VPC now has two subnets. However, the public subnet for now is totally isolated and cannot communicate with resources outside the VPC. 

In Next task, we will configure the public subnet to connect to the internet via an internet gateway.

**Images for Reference**

![](https://user-images.githubusercontent.com/89054489/232375676-ff8b58be-85cb-411c-90c7-9e2ff0bcc742.png)
![](https://user-images.githubusercontent.com/89054489/232375892-e0c89829-ff52-4e07-a722-4713a46bcbfd.png)
![](https://user-images.githubusercontent.com/89054489/232375986-619d892a-fa99-47cd-8cd6-87ed9b8cc755.png)
![](https://user-images.githubusercontent.com/89054489/232376091-f4a246c6-a5d7-400b-bfc5-93408255b3f6.png)
![](https://user-images.githubusercontent.com/89054489/232376326-9473cb49-3fc3-4a89-8505-3f2cc8e877f4.png)

---

### Task 3: Creating an Internet Gateway

An internet Gateway is a horizontally scaled, redundant, and highly available VPC componenet. It allows communication between the instance in a VPC and the internet. It imposes no availability risks or bandwidth constarains on the network traffic

   An Internet gateway serves two purposes:
   - To provide a target in route table that connects to the internet
   - to perform network address translation (NAT) for instance that were assigned public IPv4 addresses

In this task, we will create an internet gteway so that Internet Trafic can access the public subnet.
1. **Create Internet Gateway**:
   - In the left navigation pane, choose **Internet Gateways**.
   - Choose **Create internet gateway**.
   - Configure the settings:
     - **Name tag**: Lab IGW
   - Choose **Create internet gateway**.
2. **Attach Internet Gateway**: We can now attach the internet gateway to our VPC
   - Choose **Actions** and then **Attach to VPC**.
   - For **Available VPCs**, select **Lab VPC**.
   - Choose **Attach internet gateway**.

This action attaches the internet gateway to our Lab VPC. Although we can create an internet gateway and attached it to our VPC, we must also configure the public subnet route table so that it uses the internet gateway.

**Images for Reference**

![](https://user-images.githubusercontent.com/89054489/232376429-03176fbc-a959-4ff5-b379-e312916a0a97.png)
![](https://user-images.githubusercontent.com/89054489/232376470-7df08d65-82e3-4d51-91df-1dac14883343.png)
![](https://user-images.githubusercontent.com/89054489/232376557-ed63a481-8664-4654-8764-4aaeff3fbf8a.png)
![](https://user-images.githubusercontent.com/89054489/232376648-0eafce9b-eee2-43f6-962a-f6076eb5eb96.png)

---

### Task 4: Configuring Route Tables

A route table contains a set of rules, called routes,that are used to determine where network traffic is directed. Each subnet in a VPC must be associated with a route table because the table controls the routing for the subnet. A subnet can be associated with only one route table at a time, but we can asssociate multiple subnet with the same route table. 

To us ean internet gateway,a subnet's route table must contain a route that directs internet-bound trafic to the internet gateway. If a subnet is associated with a route table that has a route to na internet gateway, it is known as public subnet.

In this task, we will 
- Create a public route table for internet-bound trafic
- Add a route to the route table to direct internet-bound traffic to the internet gateway
- Associate the public subnet with the new route table.

1. **Create a Public Route Table**:
   - In the left navigation pane, choose **Route Tables**.

   Several route tables are displayed, but there is only one route table associated with Lab VPC. This route table routes traffic locally, so it is a private route table.

   In the VPC column, find the route table that shows Lab VPC, and select the check box for this route table. (Expand the column to see the names.)

   - In the Name column, choose and then enter the name Private Route Table
   - Choose **Save**
   - In the lower half of the page, choose the **Routes tab**.

   There is only one route. It shows that all traffic that is destined for 10.0.0.0/16 (which is the range of the Lab VPC) will be routed locally. This route allows all subnets in a VPC to communicate with each other.

   Now create a new public route table to send public traffic to the internet gateway.

   - Choose **Create route table**.
   - Configure the settings:
     - **Name**: Public Route Table
     - **VPC**: Lab VPC
   - Choose **Create route table**.

   Now add a route to direct internet-bound traffic (0.0.0.0/0) to the internet gateway.

2. **Add Route to Public Route Table**:
   - In the Routes tab, choose **Edit routes**.
   - Choose **Add route**.
   - Configure the settings: 
     - **Destination**: 0.0.0.0/0
     - **Target**: Internet Gateway, form the dropdown list select **Lab IGW**
   - Choose **Save changes**.

3. **Associate Route Table with Public Subnet**: This last step associates this new route table with the public subnet.

   - Choose the **Subnet associations** tab.
   - In the Subnets without explicit associations section, choose **Edit subnet associations**.
   - Select the row with **Public Subnet**.
   - Choose **Save associations**.
   
   The public subnet is now public because it has a route table entry that sends traffic to the internet via the internet gateway.

**To summarize**
   We can create a public subnet bu following these steps:
   - Create an internet gateway.
   - create a route table.
   - Add a route to the route table that directs 0.0.0.0/0 trafic to the internet gateway.
   - Associate the route table with a subnet, which tehen becomes a public subnet.

**Images for Reference**

![](https://user-images.githubusercontent.com/89054489/232376842-2bfb0358-7b0c-48c3-9d09-73c9fa67e694.png)
![](https://user-images.githubusercontent.com/89054489/232376916-93f72a36-7228-4f53-b225-d6b1d942ce8b.png)
![](https://user-images.githubusercontent.com/89054489/232377043-51ec21f3-1703-418e-a300-7a3c1a5b5e32.png)
![](https://user-images.githubusercontent.com/89054489/232377210-8c4ddbbf-33d2-4e52-8c31-2be7d861fc6e.png)
![](https://user-images.githubusercontent.com/89054489/232377295-e8c02dfe-61fb-4ced-86c4-d390d4210ed1.png)

---

### Task 5: Creating a Security Group for the Application Server

A security group acts as a virtual firewall for instances to control inbound and outbound traffic. Security groups operate at the level of the elastic network interface for the instance. Security groups do not operate at the subnet level. Thus, each instance can have its own firewall that controls traffic. If we do not specify a particular security group at launch time, the instance is automatically assigned to the default security group for the VPC.

In this task, We will create a security group that allows users to access our application server via HTTP.

1. **Create Security Group**:
   - In the left navigation pane, choose **Security Groups**.
   - Choose **Create security group**.
   - Configure the settings:
     - **Security group name**: App-SG
     - **Description**: Allow HTTP traffic
     - **VPC**: Lab VPC
   - Choose **Create security group**.

2. **Add Inbound Rule**: The settings for Inbound rule determines what traffic is perminted to reach the instance. We configure it to permit HTTP(port 80) trafic that comes from anywhere on the internet(0.0.0.0/0).

   - Choose the **Inbound Rules** tab.
   - Choose **Edit inbound rules**.
   - Choose **Add rule**.
   - Configure the settings:
     - **Type**: HTTP
     - **Source type**: Anywhere IPv4
     - **Description**: Allow web access
   - Choose **Save rules**.

   We will use this App-SG security Group in next task.

**Images for Reference**


![](https://user-images.githubusercontent.com/89054489/232377519-ab35afd8-ca33-4b6d-831b-ef321e91149e.png)
![](https://user-images.githubusercontent.com/89054489/232377674-f537fa1c-3836-4ccb-94f0-8710eff89de3.png)
![](https://user-images.githubusercontent.com/89054489/232377891-8ddb2ed2-673f-4d09-9472-976411a8211c.png)

---

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