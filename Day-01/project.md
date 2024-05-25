# Introduction to Amazon EC2

In this self-paced lab, we will practice using Amazon EC2. This provides us with a basic overview of launching, resizing, managing, and monitoring an Amazon EC2 instance.

By the end of this lab, we will be able to:

- Launch our server with termination protection enabled
- Monitor our EC2 instance
- Modify the security group that our server is using to allow HTTP access
- Resize our Amazon EC2 instance to scale
- Explore EC2 limits
- Test termination protection
- Terminate our EC2 instance

### Tips for Success

- Stay Organized: Keep track of the steps we perform to avoid confusion.
- Double-Check Settings: Small mistakes in configurations can cause issues later on.
- Use Documentation: AWS provides extensive documentation that can be helpful if we encounter issues.
- Monitor Costs: Always be aware of the potential costs associated with running EC2 instances, even if they are small.
- Security First: Always apply the principle of least privilege to our security groups and instances.

## Task 1: Launching our EC2 instance

In this task, we launch an EC2 instance with termination protection. Termination protection prevents accidentally terminating an EC2 instance. We also deploy our instance with a user data script to deploy a simple web server.

1. In the AWS Management Console on the Services menu, choose **EC2**.
2. In the left navigation pane, choose **EC2 Dashboard** to ensure that we are on the dashboard page.
3. Choose **Launch instance**, and then select **Launch instance**.

![Launch instance](https://user-images.githubusercontent.com/89054489/232049688-348fe01e-3db2-4b06-ac89-b06e4426b98c.png)

### Step 1: Name the EC2 instance

Using tags, we can categorize our AWS resources in different ways (for example, by purpose, owner, or environment). This categorization is useful when we have many resources of the same type. We can quickly identify a specific resource based on the tags that we have assigned to it. Each tag consists of a key and a value, both of which we define.

When we name our instance, AWS creates a key-value pair. The key for this pair is Name, and the value is the name we enter for our EC2 instance.

- In the **Name and tags** section, for **Name**, enter **our Server**.
- Choose the **Add additional tags** link.
- From the **Resource types** dropdown list, ensure that both **Instances** and **Volumes** are selected.

![Name and tags](https://user-images.githubusercontent.com/89054489/232050577-c19c8fb8-415e-4bac-8ace-7caabd5fa7c3.png)

### Step 2: Choose an Amazon Machine Image (AMI)

An Amazon Machine Image (AMI) provides the information required to launch an instance, which is a virtual server in the cloud. An AMI includes the following:

- A template for the root volume for the instance (for example, an operating system or an application server with applications)
- Launch permissions that control which AWS accounts can use the AMI to launch instances
- A block device mapping that specifies the volumes to attach to the instance when it is launched

The Quick Start list contains the most commonly used AMIs. We can also create our own AMI or select an AMI from the AWS Marketplace, an online store where we can sell or buy software that runs on AWS.

- Locate the **Application and OS Images (Amazon Machine Image)** section. It is just below the **Name and tags** section.
- In the **AMI Machine Image (AMI)** box, notice that **Amazon Linux 2 AMI** is selected by default. Keep this setting.

![Amazon Linux 2 AMI](https://user-images.githubusercontent.com/89054489/232051021-32a3ac55-2c1b-4af4-ae82-a32992efc781.png)

### Step 3: Choose an instance type

Amazon EC2 provides a wide selection of instance types that are optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity and give us the flexibility to choose the appropriate mix of resources for our applications. Each instance type includes one or more instance sizes so that we can scale our resources to the requirements of our target workload.

In this step, we choose a t2.micro instance. This instance type has 1 virtual CPU and 1 GiB of memory.

- Keep the default instance type, **t2.micro**.

### Step 4: Configure a key pair

Amazon EC2 uses public key cryptography to encrypt and decrypt login information. To log in to our instance, we must create a key pair, specify the name of the key pair when we launch the instance, and provide the private key when we connect to the instance.

In this lab, we do not log in to our instance, so we do not require a key pair.

- In the **Key pair (login)** section, from the **Key pair name - required** dropdown list, choose **Proceed without a key pair**.

![Key pair](https://user-images.githubusercontent.com/89054489/232051343-b4828929-396c-461f-a373-39fd8563e5a1.png)

### Step 5: Configure the network settings

Use this pane to configure networking settings. The virtual private cloud (VPC) indicates which VPC we want to launch the instance into. We can have multiple VPCs, including different ones for development, testing, and production.

- In the **Network settings** section, choose **Edit**.
- From the **VPC - required** dropdown list, choose **Lab VPC**.

The Lab VPC was created using an AWS CloudFormation template during the setup process of our lab. This VPC includes two public subnets in two different Availability Zones.

- In the **Network settings** section, for **Security group name - required**, enter **our Server security group**.

A security group acts as a virtual firewall that controls the traffic for one or more instances. When we launch an instance, we associate one or more security groups with the instance. We add rules to each security group that allow traffic to or from its associated instances. We can modify the rules for a security group at any time; the new rules are automatically applied to all instances that are associated with the security group.

In this lab, we do not log in to our instance using SSH. Removing SSH access improves the security of the instance.

- To delete the existing SSH rule, next to **Security group rule 1**, choose **Remove**.

![Remove SSH rule](https://user-images.githubusercontent.com/89054489/232052841-ff252ddf-59e1-4101-87f8-65663c565848.png)

### Step 6: Add storage

Amazon EC2 stores data on a network-attached virtual disk called Amazon Elastic Block Store (Amazon EBS).

We launch the EC2 instance using a default 8 GiB disk volume. This is our root volume (also known as a boot volume).

- In the **Configure storage** pane, keep the default storage configuration.

![Configure storage](https://user-images.githubusercontent.com/89054489/232053065-da948bec-357c-46c6-9f7f-dd658daa9fc8.png)

### Step 7: Configure advanced details

Expand the **Advanced details** pane.

When we no longer require an EC2 instance, we can terminate it, which means that the instance stops, and Amazon EC2 releases the instance's resources. We cannot restart a terminated instance. If we want to prevent our users from accidentally terminating the instance, we can enable termination protection for the instance, which prevents users from terminating instances.

- From the **Termination protection** dropdown list, choose **Enable**.

When we launch an instance in Amazon EC2, we have the option of passing user data to the instance. These commands can be used to perform common automated configuration tasks and even run scripts after the instance starts. 

Copy the following commands, and paste them into the **User data** text box:

```bash
#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your our Server!</h1></html>' > /var/www/html/index.html
```

The script does the following:
- Install an Apache web server (httpd)
- Configure the web server to automatically start on boot
- Activate the web server
- Create a simple web page

![Advanced details](https://user-images.githubusercontent.com/89054489/232053665-96b1eaf2-234b-45b4-a9db-62f2a1e93eda.png)

### Step 8: Launch an EC2 instance

Now that we have configured our EC2 instance settings, it is time to launch our instance.

- In the **Summary** section, choose **Launch instance**.

![Launch instance](https://user-images.githubusercontent.com/89054489/232054029-e7288212-91ba-4d7f-a2e3-4bc17d9c83be.png)
![Success](https://user-images.githubusercontent.com/89054489/232054153-1a5cba21-a60a-405c-b2cd-cea3190e83b2.png)

Choose **View all instances**.

The instance appears in a **Pending** state, which means that it is being launched. It then changes to **Running**, which indicates that the instance has started booting. There will be a short time before we can access the instance.

The instance receives a public Domain Name System (DNS) name that we can use to contact the instance from the Internet.

- Next to **our Server**, select the checkbox. The **Details** tab displays detailed information about our instance, including the public IPv4 address and DNS name.
- Review the information displayed in the Details, Security and Networking tabs.
- Wait for our instance to display the following. 
   - Instance State: Running
   - Status Checks:   2/2 checks passed

- Refresh if needed
![Running](https://user-images.githubusercontent.com/89054489/232054694-d95291ba-05bf-4972-951c-3d753dd29f77.png)
![2/2 checks passed](https://user-images.githubusercontent.com/89054489/232055223-3e632c60-661c-4b97-b1cd-b1c3f81a2dc7.png)
### Step 9: Open the web server in a web browser

After the instance state changes to **Running**, we can use the public DNS name of the instance to open the web page that we created.

Open a new browser tab, and enter the following URL:

```
http://[Public_DNS]
```

Replace `[Public_DNS]` with the public DNS name of our instance.

After a short time, the web page appears with the text **Hello From Your our Server!**

![Web server](https://user-images.githubusercontent.com/89054489/232054408-24e476b1-01e5-4b7e-9269-9fc4218a2380.png)

We have successfully launched our EC2 instance.

## Task 2: Monitoring the EC2 instance

In this task, we monitor our EC2 instance using the AWS Management Console.

Monitoring is an important part of maintaining the reliability, availability, and performance of our EC2 instances and our AWS solutions.

Amazon CloudWatch is a monitoring service for AWS cloud resources and the applications that we run on AWS. We can use CloudWatch to collect and track metrics, collect and monitor log files, and set alarms. 

### Step 1: Check Instance Status

1. **Navigate to the EC2 Dashboard**
  - Open the AWS Management Console.
  - Go to the EC2 Dashboard.

2. **Access the Status Checks Tab**
  - Select your instance from the list.
  - Click on the "Status checks" tab.
  - Verify that both **System reachability** and **Instance reachability** checks have passed.

  ![Status Checks](https://user-images.githubusercontent.com/89054489/232055607-191b4a4d-c97e-489c-a669-2c711ab04c4a.png)

### Step 2: Monitor CloudWatch Metrics

1. **Go to the Monitoring Tab**
  - With your instance selected, click on the "Monitoring" tab.
  - Here, you can view Amazon CloudWatch metrics for your instance.
  - You may see basic monitoring metrics at 5-minute intervals by default.

This tab displays Amazon CloudWatch metrics for our instance. Currently, there are not many metrics to display because the instance was recently launched.

2. **Enable Detailed Monitoring (Optional)**

Amazon EC2 sends metrics to Amazon CloudWatch for our
EC2 instances. Basic (5 minute) monitoring is enabled by default. You can enable detailed (1 minute) monitoring.

  - To get more granular data, enable detailed monitoring for 1-minute intervals.

### Step 3: Access System Log

1. **Get System Log**
  - At the top of the page, choose the **Actions** dropdown menu.
  - Select **Monitor and troubleshoot > Get system log**.
  - This displays the console output of the instance.

The system log displays the console output of the instance, which is a valuable tool for diagnosing problems. It is especially useful for troubleshooting kernel problems and service configuration issues that could cause an instance to terminate or become unreachable before its SSH daemon can be started. If we do not see a system log, wait a few minutes and then try again.

![Access System log](https://user-images.githubusercontent.com/89054489/232056705-86e06703-c1e1-4188-af52-59847883c5dd.png)


2. **Review the System Log**
  - Scroll through the log to verify that the HTTP package was installed as per your user data script.
  - You should see entries similar to the example below:
    
    [   26.760639] cloud-init[3280]: Installed:
    [   26.770051] cloud-init[3280]: httpd.x86_64 0:2.4.52-1.amzn2
    [   26.777748] cloud-init[3280]: Dependency Installed:
    [   26.781750] cloud-init[3280]: apr.x86_64 0:1.7.0-9.amzn2
    [   26.793739] cloud-init[3280]: apr-util.x86_64 0:1.6.1-5.amzn2.0.2
    [   26.796595] cloud-init[3280]: apr-util-bdb.x86_64 0:1.6.1-5.amzn2.0.2
    [   26.805964] cloud-init[3280]: generic-logos-httpd.noarch 0:18.0.0-4.amzn2
    [   26.817765] cloud-init[3280]: httpd-filesystem.noarch 0:2.4.52-1.amzn2
    [   26.829760] cloud-init[3280]: httpd-tools.x86_64 0:2.4.52-1.amzn2
    [   26.833753] cloud-init[3280]: mailcap.noarch 0:2.1.41-2.amzn2
    [   26.845761] cloud-init[3280]: mod_http2.x86_64 0:1.15.19-1.amzn2.0.1
    [   26.849762] cloud-init[3280]: Complete!
    
  ![system log](https://user-images.githubusercontent.com/89054489/232056915-92fbf2c7-08f8-4d1a-875b-1bb858bc1f65.png)

3. **Return to the EC2 Dashboard**

  - Click "Cancel" to exit the system log and return to the Amazon EC2 dashboard view.

### Step 4: Capture Instance Screenshot

1. **Get Instance Screenshot**
  - With your instance still selected, open the **Actions** dropdown menu.
  - Choose **Monitor and troubleshoot > Get instance screenshot**.
  - This captures an image of what your EC2 instance's console currently looks like.

  ![Instance Screenshot](https://user-images.githubusercontent.com/89054489/232057216-d68f078d-16b6-43f1-8d82-0546e50f8dca.png)

2. **Review the Screenshot**
  - The screenshot provides a visual representation of your instance's console, useful for diagnosing issues if the instance is not reachable via SSH or RDP.

3. **Exit the Screenshot View**
  - Click "Cancel" to return to the EC2 Dashboard.

We now have a CloudWatch alarm set up to monitor the CPU utilization and troubleshoot your EC2 instances using the AWS Management Console. Regular monitoring helps ensure that your applications remain available and performant.

## Task 3: Modifying the security group

In this task, we modify the security group to allow HTTP for accessing the web server that while launching the EC2 instance, we provided a script that installed a web server and created a simple web page. In this task, you access content from the web server.
#### Step 1: Copy the Public IPv4 Address

1. **Select the EC2 instance**:
  - Go to the EC2 Management Console.
  - Select the checkbox next to the EC2 instance you created.

2. **Copy the Public IPv4 address**:
  - Choose the **Details** tab.
  - Copy the Public IPv4 address to your clipboard.

#### Step 2: Attempt to Access the Web Server

1. **Open a new browser tab**:
  - Paste the copied IP address into the address bar and press Enter.

2. **Check the Access**:
  - If you can't access the server, it's likely because the security group does not allow inbound traffic on port 80 (HTTP).

![Details Tab](https://user-images.githubusercontent.com/89054489/232058038-743e03ec-83d0-43a3-a163-39dac9ecaeff.png)

We are not currently able to access your web server because the security group is not permitting inbound traffic on port 80, which is used for HTTP web requests. This is a demonstration of how to use a security group as a firewall to restrict the network traffic that is allowed in and out of an instance.

### Step 3: Modify the security group

- Locate the security group that is associated with **our Server**, and select the checkbox.
- Choose **Edit inbound rules**.
**Add a Rule for HTTP**:
  - Choose **Add rule**.
  - Configure the rule as follows:
    - **Type**: HTTP
    - **Source**: Anywhere-IPv4 (0.0.0.0/0)

- Note: Allowing traffic from Anywhere-IPv4 means any IP can access your instance, which is acceptable for testing purposes but not recommended for production.

![Browser](https://user-images.githubusercontent.com/89054489/232057931-b56b6dcd-7d80-4e4e-b5dc-5629a65fa6b7.png)

![Security Groups](https://user-images.githubusercontent.com/89054489/232058351-80398444-16f9-46a0-bdad-c5aea2397767.png)

### Step 4: Save the rule

- Choose **Save rules**.

Our security group now allows HTTP traffic to our EC2 instance via HTTP, demonstrating a basic yet essential aspect of managing AWS security groups for EC2 instances.instance. This change might take a few minutes to take effect.

### Verify the chnges 
- Return to the web server browser tab with the public IPv4 address that you previously opened, and choose to refresh the page.


![Inbound Rules](https://user-images.githubusercontent.com/89054489/232058509-51ef3ee4-9c0a-4ef8-a87a-6d4c2cdab905.png)

You should see the message Hello From Your Web Server!

## Task 4: Resizing the instance

In this task, we resize our instance to scale up its resources.
As our needs change, we might find that our instance is over utilized (too small) or under utilized (too large). If so, we can change the instance type. For example, if a t2.micro instance is too small for its workload, we can change it to an m5.medium instance. Similarly, we can change the size of a disk.

Before you can resize an instance, we must stop it.

When we stop an instance, it is shut down. There is no charge for a stopped EC2 instance, but the storage charge for attached EBS volumes remains

#### Step 1: Stop Your Instance

1. **Navigate to Instances**:
   - Open the EC2 Management Console.
   - In the left navigation pane, select **Instances**.

2. **Stop the Instance**:
   - Select the checkbox next to your server instance.
   - At the top of the page, select the **Instance state** dropdown menu.
   - Choose **Stop instance**.
   - In the confirmation pop-up window, choose **Stop**.
   - Wait for the instance state to display **Stopped**.
  ![Stop Instance](https://user-images.githubusercontent.com/89054489/232184239-3b047a64-a3d2-4202-baaf-0ef3620d90cd.png)

  ![Stop Instance](https://user-images.githubusercontent.com/89054489/232184259-61629dbd-e958-4528-9c7e-4984f4bc4492.png)

#### Step 2: Change the Instance Type

1. **Select the Instance**:
   - Ensure the checkbox next to your instance is selected.
   - From the **Actions** dropdown menu, select **Instance settings** then **Change instance type**.

2. **Change Instance Type**:
   - In the instance type selection window, choose **t2.nano**.
   - Choose **Apply**.

   ![Change Instance Type](https://user-images.githubusercontent.com/89054489/232184324-17973b2a-ebec-48ba-97e3-1a7b393d905b.png)
   ![Select t2.nano](https://user-images.githubusercontent.com/89054489/232184391-4f805399-a712-423c-872f-94bcc4f2a7e9.png)

#### Step 3: Resize the EBS Volume

1. **Navigate to Volumes**:
   - In the left navigation pane, select **Volumes**.

2. **Modify the Volume**:
   - Select the checkbox for the volume attached to our instance.
   - From the **Actions** dropdown menu, select **Modify Volume**.

3. **Increase Volume Size**:
   - Change the **Size (GiB)** to **10**.
   - Choose **Modify**.
   - In the confirmation pop-up window, choose **Modify** again.

   ![Modify Volume](https://user-images.githubusercontent.com/89054489/232184554-45188099-3e45-4d59-9a93-e5ef4736b417.png)
   ![Increase Volume Size](https://user-images.githubusercontent.com/89054489/232184576-ee6cadcd-886e-4c4e-8ae5-b4b44a801440.png)

#### Step 4: Restart the Resized Instance

Now start the instance again, which now has less memory but more disk space.

1. **Navigate to Instances**:
  - Go back to the **Instances** page.

2. **Start the Instance**:
  - Select the checkbox next to your instance.
  - From the **Instance state** dropdown menu, choose **Start instance**.

  ![Start Instance](https://user-images.githubusercontent.com/89054489/232184660-b5086f7a-cab4-4914-8da2-bc7d4e39b09f.png)

Now our EC2 instance will be resized to a t2.nano type with an increased EBS volume size of 10 GiB. This allows for adjusting resources as per the workload requirements while maintaining cost efficiency.


## Task 5: Exploring EC2 limits

In this task, we explore the limits of EC2 resources.

Amazon EC2 provides different resources that we can use. These resources include images, instances, volumes, and snapshots. When we create an AWS account, there are default limits on these resources on a per-Region basis.


### Step 1: Open the Limits console

In the left navigation pane of the **EC2 Dashboard**, choose **Limits**.

### Step 2: View EC2 limits

The **Limits** page shows the current limits for our EC2 resources, such as the maximum number of instances, volumes, and elastic IP addresses.

### Step 3: Request a limit increase

If we need to increase a limit, we can request a limit increase. 

- Choose the **Request limit increase** button.
- Follow the instructions to submit a request to increase the limit.

![Limits](https://user-images.githubusercontent.com/89054489/232184819-af553228-b891-400d-b2b5-efbbbaeccfd1.png)


## Task 6: Testing termination protection

We can delete our instance when we no longer need it. This is referred to as terminating our instance. We cannot connect to or restart an instance after it has been terminated.

In this task, we test the termination protection feature.

### Step 1: Attempt to terminate the instance

- In the left navigation pane of the **EC2 Dashboard**, choose **Instances**.
- Next to **our Server**, select the checkbox.
- Choose the **Instance state** dropdown menu, and select **Terminate instance**.
![Termination](https://user-images.githubusercontent.com/89054489/232184868-fea311e0-3351-44f0-85d0-a10cf52bdf3a.png)


A warning message appears, indicating that termination protection is enabled for the instance.

![termination failed](https://user-images.githubusercontent.com/89054489/232184919-c52e5ba6-fded-48f6-8a95-95a15aaef4dd.png)

### Step 2: Disable termination protection

- With the instance still selected, choose the **Actions** dropdown menu, and then select **Instance settings**.
- Choose **Change termination protection**.
- Select **Disable**, and then choose **Save**.

### Step 3: Terminate the instance

- Choose the **Instance state** dropdown menu, and select **Terminate instance**.

The instance is terminated successfully.

## Task 7: Terminating the instance

In this task, we terminate our instance to avoid any further charges.

### Step 1: Terminate the instance

- In the left navigation pane of the **EC2 Dashboard**, choose **Instances**.
- Next to **our Server**, select the checkbox.
- Choose the **Instance state** dropdown menu, and select **Terminate instance**.

### Step 2: Confirm termination

- In the confirmation dialog box, choose **Terminate**.

Our instance is terminated, and we no longer incur charges for it.

## Conclusion

In this lab, we launched, resized, managed, monitored, and terminated an Amazon EC2 instance. We also configured security groups, set up CloudWatch alarms, and tested termination protection. By completing these tasks, we gained hands-on experience with key features of Amazon EC2.