# Introduction to Amazon Relational Database Service (Amazon RDS)

## Overview

Creating a database traditionally requires a database administrator or a systems administrator. In the cloud, this process is simplified using Amazon Relational Database Service (Amazon RDS).

### Objectives
After completing this lab, we should be able to:
- Launch a database using Amazon RDS
- Configure a web application to connect to the database instance

### Architecture
The architecture will look like the following example:

![Architecture Diagram](https://user-images.githubusercontent.com/89054489/232302566-53314859-ccb0-40fc-a3e5-15975f486ee8.png)


## Task 1: Creating an Amazon RDS Database

In this task, We will create a **MySQL** database in the **(VPC)** virtual private cloud.
- MySQL is a popular open-source relational database management system (RDBMS), so there are no software licensing fees.

### Step-by-Step Instructions

1. **Access the AWS Management Console:**
   - Arrange the AWS Management Console tab .

2. **Navigate to Amazon RDS:**
   - On the Services menu, choose RDS.

3. **Create a Database:**
   - Choose `Create database`.
   - Under Engine options, select `MySQL`.
   - In the Templates section, select `Dev/Test`.

The options include several use cases, ranging from enterprise-class databases to Dev/Test systems. Among these, Amazon Aurora stands out as a MySQL-compatible system that has been re-architected specifically for the cloud. If the company relies on large-scale MySQL or PostgreSQL databases, Aurora can offer enhanced performance and scalability, making it a suitable choice for high-demand applications.

4. **Database Configuration:**

You can now select a database configuration, including software version, instance class, storage, and login settings. The Multi-AZ deployment option automatically creates a replica of the database in a second Availability Zone to ensure high availability.

   - In the Availability and Durability section, choose the Single DB instance.

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
     - Existing VPC security groups: Remove default security group and 
     - Add security group: From the dropdown list and select `DB-SG`.

   - Scroll to the Monitoring section and clear (deselect) the `Enable Enhanced monitoring` option.

   - Scroll to the Additional configuration section and expand it. For Initial database name, enter `inventory`. *This is the logical name of the database that the application will use.*

 We can review the many other options displayed on the page, but leave them set to their default values. Options include automatic backups, the ability to export log files, and automatic version upgrades.

 *The ability to activate these features with check boxes demonstrates the power of using a fully managed database solution. This approach eliminates the need for manually installing, backing up, and maintaining the database yourself, significantly simplifying database management tasks.*

5. **Create the Database:**
   - At the bottom of the page, choose `Create database`.
   - Wait for the database instance status to be `Available`.

If you receive an error message that mentions `rds-monitoring-role`, confirm that you have cleared the "Enable Enhanced Monitoring" option in the previous step, and then try again.

Before you continue to the next task, ensure that the database instance status is "Available." This process could take several minutes.


**Images for Reference**

![Creating Database](https://user-images.githubusercontent.com/89054489/232353681-a70aea7d-c5b5-4410-980c-66ca8d1d5fb8.png)
![Creating Database](https://user-images.githubusercontent.com/89054489/232353751-e6271b72-49c8-4b1c-b882-2ca0e61e87ea.png)
![Engine options](https://user-images.githubusercontent.com/89054489/232353814-01c69e38-88ee-4d7b-b185-8ffb36178c87.png)
![Templates](https://user-images.githubusercontent.com/89054489/232353847-bc6eef15-0973-47b6-8f3c-0b8c5fbf6227.png)
![Availability and Durability](https://user-images.githubusercontent.com/89054489/232353895-20728873-a935-45ba-8c0b-88eab146dffc.png)
![Setting](https://user-images.githubusercontent.com/89054489/232354026-28da3aee-8aef-4944-b74b-2c57c4423786.png)
![Configuration](https://user-images.githubusercontent.com/89054489/232354116-8307a3b4-4623-47a4-a406-e547faf91bc0.png)
![Storage](https://user-images.githubusercontent.com/89054489/232354200-267e1656-42ad-45d1-a3f6-0be4b8b0dbc7.png)
![Connectivity](https://user-images.githubusercontent.com/89054489/232354394-2136a1c5-ced4-4f35-9f28-0125bf6d7ef9.png)
![Monitoring](https://user-images.githubusercontent.com/89054489/232354504-74480e52-d72b-4918-a117-ec7786edc9a2.png)
![Add Configuration](https://user-images.githubusercontent.com/89054489/232354533-b88ce82a-0aae-451f-9756-bedacbb9ce2c.png)
![Create Database](https://user-images.githubusercontent.com/89054489/232354556-7da86f3c-e808-4d49-8d26-a218dfb65670.png)
![Creating Summery](https://user-images.githubusercontent.com/89054489/232354829-d0683382-c147-4e46-8c02-eb3a6774ce67.png)
![Created](https://user-images.githubusercontent.com/89054489/232355297-42a2756f-d239-4c8a-8d48-9e08969875b3.png)


## Task 2: Configuring Web Application Communication with a Database Instance

This will automatically deployed an Amazon Elastic Compute Cloud (Amazon EC2) instance with a running web application. You must use the IP address of the instance to connect to the application.

### Step-by-Step Instructions

1. **Locate the App Server:**
   - On the Services menu, choose `EC2`.
   - In the left navigation pane, choose `Instances`.
   - In the center pane, there is a running instance `App Server`
   - Select the check box for the `App Server` instance.
   - In the Details tab, copy the `Public IPv4 address` to your clipboard. 

      Tip: If you hover over the IP address, a copy icon appears. To copy the displayed value, choose the icon.

2. **Open the Web Application:**
   - Open a new web browser tab, paste the IP address into the address bar, and press Enter.
   - The web application should appear. It does not display much information because the application is not yet connected to the database.

3. **Configure the Application:**

   Now configure the application to use the Amazon RDS database instance that we created earlier. First, retrieve the database endpoint so that the application knows how to connect to the database.
   
   Do not close the application tab. We will return to it soon.
   - Choose `Settings`.
   - Return to the AWS Management Console, choose RDS, and navigate to the `inventory-db` instance.
   - In the Connectivity & security section, copy the `Endpoint` to  clipboard.
   - Return to the browser tab with the inventory application and enter the following values:
     - Endpoint: Paste the copied endpoint
     - Database: `inventory`
     - Username: `admin`
     - Password: `lab-password`
   - Choose `Save`.

   The application will now connect to the database, load some initial data, and display information.

4. **Add Inventory Records:**

   We can use the web application to add, edit, and delete inventory information. The inventory information is stored in the Amazon RDS MySQL database that you created earlier in the lab. This ensures that in the event of any failure in the application server, you will not lose any data, and multiple application servers can access the same data.

   - Use the web application to add inventory records.
   - Ensure that the table has 5 or more inventory records.

The application is successfully launched and connected it to the database.

### Optional: To Access Saved Parameters

- Go to the AWS Management console.
- On the Services menu, choose `Systems Manager`.
- In the left navigation menu, choose `Parameter Store`.


**Images for Reference**

![Ec2](https://user-images.githubusercontent.com/89054489/232355327-00118c39-051c-4f12-8798-28d0134ab47c.png)
![Instance](https://user-images.githubusercontent.com/89054489/232355390-6933bdb6-8523-4053-b249-d8e3829bec1f.png)
![Public IP Browser](https://user-images.githubusercontent.com/89054489/232355431-c6c5f315-e0d4-4416-bf0a-fda7a9045dc4.png)
![Inventory](https://user-images.githubusercontent.com/89054489/232355594-47a2c348-b5fa-439a-96d1-0a47fc32782e.png)
![Endpoint and Port](https://user-images.githubusercontent.com/89054489/232355189-d4316604-dee8-4e1a-9901-2f72acca2bef.png)
![Data Entry](https://user-images.githubusercontent.com/89054489/232355685-1f2a9dbb-07c0-45dd-9912-a7578a542a24.png)
![Connecting Web App](https://user-images.githubusercontent.com/89054489/232355758-bed4df89-d178-41ad-939b-2db8f02341b8.png)
![Adding Entry](https://user-images.githubusercontent.com/89054489/232355817-058bed46-de61-4b40-b9b7-8505ec6c67c3.png)
![System Manager](https://user-images.githubusercontent.com/89054489/232355898-b367108d-151a-422c-923f-62d6c6f51b41.png)
![Parameter Store](https://user-images.githubusercontent.com/89054489/232357268-18e57394-496f-43d6-830a-84b84f943e85.png)



## Congratulations !

We have successfully completed the tasks. Launched an Amazon RDS MySQL database and connected a web application to it.