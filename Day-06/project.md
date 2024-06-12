# Introduction to IAM

## Overview
In this, we will explore users, groups, and policies in the AWS Identity and Access Management (IAM) service.

### Objectives
After completing this project, we will know how to:
- Explore pre-created IAM Users and Groups.
- Inspect IAM policies as applied to the pre-created groups.
- Follow a real-world scenario, adding users to groups with specific capabilities enabled.
- Locate and use the IAM sign-in URL.

- Experiment with the effects of policies on service access.

---

## Task 1: Explore the Users and Groups

In this task, we will explore the user and group that have already been created in IAM.

1. **Identify the AWS Region:**
   - Note the Region displayed in the upper-right corner of the console page (e.g., N. Virginia).

2. **Access IAM:**
   - Choose the **Services** menu, locate the **Security, Identity, & Compliance** services, and select **IAM**.

3. **Explore Users:**
   - In the navigation pane on the left, select **Users**.
   - The following IAM users have been created for you: **user-1**, **user-2**, **user-3**.

   - Choose the name of **user-1** to view the summary page.

4. **User-1 Details:**
   - On the **Permissions** tab, notice that **user-1** does not have any permissions.
   - On the **Groups** tab, notice that **user-1** is not a member of any groups.

   - On the **Security credentials** tab, notice that **user-1** is assigned a Console password. -  This allows the user to access the AWS Management Console.

5. **Explore User Groups:**
   - In the navigation pane on the left, choose **User groups**.

   - The following groups have been created: **EC2-Admin**, **EC2-Support**, **S3-Support**.

6. **Explore EC2-Support Group:**

   - Choose the **EC2-Support** group to view the summary page.- This brings to the summary page for the **EC2-Support group**.
   - On the **Permissions** tab, notice the only managed policy associated with it **AmazonEC2ReadOnlyAccess**.

   *Managed policies are prebuilt policies (built either by AWS or by your administrators) that can be attached to IAM users and groups. When the policy is updated, the changes to the policy are immediately applied against all users and groups that are attached to the policy.*

   - Under **Policy Name**, choose the link for **AmazonEC2ReadOnlyAccess** policy.

   - On the **{} JSON** tab, review the policy JSON.

   *A policy defines what actions are allowed or denied for specific AWS resources. This policy is granting permission to List and Describe (view) information about Amazon Elastic Compute Cloud (Amazon EC2), Elastic Load Balancing, Amazon CloudWatch, and Amazon EC2 Auto Scaling. This ability to view resources, but not modify them, is ideal for assigning to a support role.*

   *Statements in an IAM policy have the following basic structure:*
   - *Effect says whether to Allow or Deny the permissions.* 
   - *Action specifies the API calls that can be made against an AWS service (for example, cloudwatch:ListMetrics).*
   - *Resource defines the scope of entities covered by the policy rule (for example, a specific Amazon Simple Storage Service [Amazon S3] bucket or Amazon EC2 instance.* 

   - *An asterisk [ * ] means any resource).*
   

   
   In the navigation pane on the left, choose User groups.

7. **Explore S3-Support Group:**
   - Choose the **S3-Support** group and view the **Permissions** tab.
   - The policy **AmazonS3ReadOnlyAccess** is attached to S3-Support group.
   - Under **Policy Name**, choose the link for **AmazonS3ReadOnlyAccess** policy.

   - Review the policy JSON under **{} JSON**.
   
   *This policy has permissions to Get and List for all resources in Amazon S3.*

   In the navigation pane on the left, choose User groups.
8. **Explore EC2-Admin Group:**

   *This group is different from the other two. Instead of a managed policy, the group has an inline policy, which is a policy assigned to just one user or group. Inline policies are typically used to apply permissions for specific situations.*

   - Choose the **EC2-Admin** group and view the **Permissions** tab.
   - Notice the inline policy **EC2-Admin-Policy**.
   - Under Policy Name, choose the name of the **EC2-Admin-Policy** policy.

   - Review the policy JSON under the **JSON** tab.

   *This policy grants permission to Describe information about Amazon EC2 instances, and also the ability to Start and Stop instances.*

   At the bottom of the screen, choose **Cancel** to close the policy.
---

**Images for Reference**

![](https://user-images.githubusercontent.com/89054489/232415735-69d85fb7-c94d-4743-9d20-e675344c869e.png)

![](https://user-images.githubusercontent.com/89054489/232415878-8cd9199a-e219-49ba-a988-160b1f63fa64.png)

![](https://user-images.githubusercontent.com/89054489/232416160-6f6d2902-c4db-4427-8f7d-403ffb2627a7.png)

![](https://user-images.githubusercontent.com/89054489/232416248-e9540c29-225e-4fd6-98ae-e470d93d537f.png)

![](https://user-images.githubusercontent.com/89054489/232416533-5c78529a-d0f2-4ba1-af64-8de5caf272eb.png)

![](https://user-images.githubusercontent.com/89054489/232416745-c3597264-a7ec-4ca1-958f-27f35e64f25e.png)

![](https://user-images.githubusercontent.com/89054489/232416968-2bc8183b-b582-4dc8-86c8-e5f89a165258.png)

![](https://user-images.githubusercontent.com/89054489/232417463-d27861e8-dcbf-4934-a600-af52f381c970.png)

![](https://user-images.githubusercontent.com/89054489/232417746-7c27e1f5-38d5-4285-91d3-6faabab7535f.png)


### Business Scenario
The company is growing its use of AWS services, and is using many Amazon EC2 instances and Amazon S3 buckets. We want to give access to new staff depending upon their job function.

| User   | In Group     | Permissions                                |
|--------|--------------|--------------------------------------------|
| user-1 | S3-Support   | Read-only access to Amazon S3              |
| user-2 | EC2-Support  | Read-only access to Amazon EC2             |
| user-3 | EC2-Admin    | View, Start, and Stop Amazon EC2 instances |

---

## Task 2: Add Users to Groups

### Steps to Add Users to Groups

1. **Add user-1 to S3-Support Group:**
   *The company recently hired user-1 into a role where they will provide support for Amazon S3. We will add user-1 to the S3-Support group so that they inherit the necessary via the attached AmazonS3ReadOnlyAccess policy.*

   - In the navigation pane on the left, choose **User groups**.
   - Choose the **S3-Support** group.
   - On the **Users** tab, choose **Add users**.
   - Select **user-1** and choose **Add users**.
   - Confirm on the User tab **user-1** has been added to the group.

2. **Add user-2 to EC2-Support Group:**

   *The company have hired user-2 into a role where they will provide support for Amazon EC2. We will add user-2 to the EC2-Support group so that they inherit the necessary permissions via the attached AmazonEC2ReadOnlyAccess policy.*
   
   - Follow similar steps as above to add **user-2** to the **EC2-Support** group.

3. **Add user-3 to EC2-Admin Group:**

   *The company have hired user-3 as your Amazon EC2 administrator to manage your EC2 instances. You will add them to the EC2-Admin group so that they inherit the necessary permissions via the attached EC2-Admin policy.*

   - Follow similar steps as above to add **user-3** to the **EC2-Admin** group.

4. **Verify Group Memberships:**
   - In the navigation pane on the left, choose **User groups**.
   - Ensure each group has a "1" in the **Users** column.

   This indicates the number of users in each group. If you do not have a 1 for the Users column for a group, revisit the previous steps to ensure that each user is assigned to a group, as shown in the table in the Business scenario section.

---
**Images for Reference**

![](https://user-images.githubusercontent.com/89054489/232417978-40771a26-7500-4e20-b2c0-553d37327576.png)

![](https://user-images.githubusercontent.com/89054489/232418151-444adfca-09dc-41a3-ac7f-d97624d013cc.png)

![](https://user-images.githubusercontent.com/89054489/232418293-3599927b-3052-4872-8463-a40234004baa.png)

![](https://user-images.githubusercontent.com/89054489/232418690-909ecd47-f8eb-4302-a8cb-767387d8bd50.png)

![](https://user-images.githubusercontent.com/89054489/232418865-c379a67a-22d8-478a-9895-f903d53adf7f.png)

![](https://user-images.githubusercontent.com/89054489/232419502-0d137f6e-31eb-4ca7-ade3-8d15db913c19.png)


## Task 3: Sign in and Test Users

In this task, We will test the permissions of each IAM user in the console.

### Get the Console Sign-In URL
- In the navigation pane on the left, choose **Dashboard**.
- Copy the **Sign-in URL for IAM users** in this account to a text editor.
   - The sign-in URL looks similar to the following: `https://123456789012.signin.aws.amazon.com/console`

   *This link can be used to sign in to the AWS account that you are currently using.*

### Test User-1 Permissions

   *We will now sign-in as user-1, who has been hired as your Amazon S3 storage support staff.*

1. **Sign in as user-1:**

   - Open a private or incognito window in your browser.
   - Paste the sign-in link and press ENTER.

   - Sign in with the following credentials:
   
     - IAM user name: `user-1`
     - Password: `Password1`

2. **Verify S3 Access:**
   - Choose the **Services** menu, and select **S3**.
   - Browse the contents of a bucket to confirm read-only access.

      *Because this user is part of the S3-Support group in IAM, they have permissions to view a list of Amazon S3 buckets and their contents.*
      
3. **Verify EC2 Access:**

   Now, we will test if the user has access to Amazon EC2.

   - Choose the **Services** menu, and select **EC2**.
   - Choose the **Instance**
   - But We cannot see any instances. Instead, an error message says you are not authorized to perform this operation. 

   - This user has not been assigned any permissions to use Amazon EC2.


4. **Sign out user-1:**
   - In the upper-right corner of the page, choose **user-1** and select **Sign Out**.

### Test User-2 Permissions

   *We will now sign in as user-2, who has been hired as Amazon EC2 support person.*

1. **Sign in as user-2:**
   - Paste the sign-in link into the private browser and press ENTER.
   - Sign in with the following credentials:
     - IAM user name: `user-2`
     - Password: `Password2`

2. **Verify EC2 Access:**
   - Choose the **Services** menu, and select **EC2**.
   - Choose the **Instance**

   *We are now able to see an EC2 instance. However, we cannot make any changes to Amazon EC2 resources because we have read-only permissions. If we cannot see an EC2 instance, then the Region might be incorrect. In the upper-right corner of the page, choose the Region name, and then choose the Region that we were in at the beginning (for example, N. Virginia).*

3.   **Varify Operation on EC2**
   - Select the **EC2** instance.
   - Choose the Instance state menu.
   - Then choose **Stop** instance.
   - To confirm that you want to stop, choose **Stop**.

   *An error message appears and says that You are not authorized to perform this operation. This demonstrates that the policy only allows us to view information without making changes.*

3. **Verify if user-2 can access Amazon S3**

   - Choose the **Services** menu, and select **S3**.

   - An error message says We don't have permissions to list buckets because user-2 does not have permissions to use Amazon S3.

4. **Sign out user-2:**
   - In the upper-right corner of the page, choose **user-2** and select **Sign Out**.

### Test User-3 Permissions
   *We will now sign-in as user-3, who has been hired as your Amazon EC2 administrator.*

1. **Sign in as user-3:**
   - Paste the sign-in link into the private browser and press ENTER.
   - Sign in with the following credentials:
     - IAM user name: `user-3`

     - Password: `Password3`

2. **Verify EC2 Access:**
   - Choose the **Services** menu, and select **EC2**.

   - Choose the **Instance**

   An EC2 instance is listed. As an Amazon EC2 Administrator, this user should have permissions to Stop the EC2 instance. If you cannot see an EC2 instance, then your Region might be incorrect. In the upper-right corner of the page, choose the Region name, and then choose the Region that you were in at the beginning of the lab (for example, N. Virginia).

3. **Varify Operation on EC2**
   - Select the **EC2** instance.
   - Choose the Instance state menu.
   - Then choose **Stop** instance.
   - To confirm that you want to stop, choose **Stop**.

   This time, the action is successful because user-3 has permissions to stop EC2 instances. The Instance state changes to Stopping and starts to shut down.
---

**Images for Reference**


![](https://user-images.githubusercontent.com/89054489/232419782-85160221-3ae4-4193-95dc-69584e5af70b.png)

![](https://user-images.githubusercontent.com/89054489/232420182-172e3d91-1505-4c5e-b4ec-7d06036c06bc.png)

![](https://user-images.githubusercontent.com/89054489/232420395-76d9e3a0-53a2-4b11-8bd0-2693ba8fee37.png)

![](https://user-images.githubusercontent.com/89054489/232420598-e294ff59-3cf2-49bb-9226-c1cb0c705936.png)

![](https://user-images.githubusercontent.com/89054489/232420815-7fbfe42f-ebad-4c16-9f4c-b431b39f9ee2.png)

![](https://user-images.githubusercontent.com/89054489/232421059-6255f3f9-3949-471e-bf1e-4e9de16ebe0f.png)

![](https://user-images.githubusercontent.com/89054489/232421185-cd5b58db-7e8f-4c55-9088-0a000d1c59a4.png)

![](https://user-images.githubusercontent.com/89054489/232421735-2d056134-75c5-4882-973a-5db67688123b.png)

![](https://user-images.githubusercontent.com/89054489/232421883-3ce73f7f-e539-4487-a9da-356b5c51515a.png)



#### Congratulations! You have completed the task.