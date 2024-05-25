# Lab 4 - Introduction to Amazon Relational Database Service (Amazon RDS)

## Lab Overview

Creating a database traditionally requires a database administrator or a systems administrator. In the cloud, this process is simplified using Amazon Relational Database Service (Amazon RDS).

### Objectives
After completing this lab, you should be able to:
- Launch a database using Amazon RDS
- Configure a web application to connect to the database instance

### Architecture
Your architecture will look like the following example:

![Architecture Diagram](https://user-images.githubusercontent.com/89054489/232302566-53314859-ccb0-40fc-a3e5-15975f486ee8.png)

### Duration
This lab requires approximately 30 minutes to complete.

## Task 1: Creating an Amazon RDS Database

In this task, you will create a MySQL database in your virtual private cloud (VPC).

### Step-by-Step Instructions

1. **Access the AWS Management Console:**
   - Use Chrome or Firefox as your web browser for this lab.

2. **Navigate to Amazon RDS:**
   - On the Services menu, choose RDS.

3. **Create a Database:**
   - Choose `Create database`.
   - Under Engine options, select `MySQL`.
   - In the Templates section, select `Dev/Test`.

4. **Database Configuration:**
   - In the Settings section, configure the following options:
     - DB instance identifier: `inventory-db`
     - Master username: `admin`
     - Master password: `lab-password`
     - Confirm password: `lab-password`
   - In the DB instance class section, select `Burstable classes (includes t classes)` and choose `db.t3.micro`.
   - In the Storage section:
     - Storage type: `General Purpose SSD (gp2)`
     - Allocated storage: `20 GiB`
   - In the Connectivity section:
     - Virtual private cloud (VPC): `Lab VPC`
     - Existing VPC security groups: Remove default and add `DB-SG`.
   - Scroll to the Monitoring section and clear (deselect) the `Enable Enhanced monitoring` option.
   - Scroll to the Additional configuration section and expand it. For Initial database name, enter `inventory`.

5. **Create the Database:**
   - At the bottom of the page, choose `Create database`.
   - Wait for the database instance status to be `Available`.

![Creating Database Screenshots](https://user-images.githubusercontent.com/89054489/232353681-a70aea7d-c5b5-4410-980c-66ca8d1d5fb8.png)
![Creating Database Screenshots](https://user-images.githubusercontent.com/89054489/232353751-e6271b72-49c8-4b1c-b882-2ca0e61e87ea.png)

## Task 2: Configuring Web Application Communication with a Database Instance

### Step-by-Step Instructions

1. **Locate the App Server:**
   - On the Services menu, choose `EC2`.
   - In the left navigation pane, choose `Instances`.
   - Select the check box for the `App Server` instance.
   - In the Details tab, copy the `Public IPv4 address` to your clipboard.

2. **Open the Web Application:**
   - Open a new web browser tab, paste the IP address into the address bar, and press Enter.
   - The web application should appear. It does not display much information because the application is not yet connected to the database.

3. **Configure the Application:**
   - Choose `Settings`.
   - Return to the AWS Management Console, choose RDS, and navigate to the `inventory-db` instance.
   - In the Connectivity & security section, copy the `Endpoint` to your clipboard.
   - Return to the browser tab with the inventory application and enter the following values:
     - Endpoint: Paste the copied endpoint
     - Database: `inventory`
     - Username: `admin`
     - Password: `lab-password`
   - Choose `Save`.

4. **Add Inventory Records:**
   - Use the web application to add inventory records.
   - Ensure that the table has 5 or more inventory records.

![Connecting Web App Screenshots](https://user-images.githubusercontent.com/89054489/232355297-42a2756f-d239-4c8a-8d48-9e08969875b3.png)
![Connecting Web App Screenshots](https://user-images.githubusercontent.com/89054489/232355758-bed4df89-d178-41ad-939b-2db8f02341b8.png)

### Optional: Accessing Saved Parameters
- Go to the AWS Management console.
- On the Services menu, choose `Systems Manager`.
- In the left navigation menu, choose `Parameter Store`.

![Parameter Store Screenshots](https://user-images.githubusercontent.com/89054489/232355898-b367108d-151a-422c-923f-62d6c6f51b41.png)

## Lab Complete

Congratulations! You have successfully completed the lab. You have launched an Amazon RDS MySQL database and connected a web application to it.