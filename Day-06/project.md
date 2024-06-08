# Lab 6: Introduction to IAM

## Lab Overview
In this lab, you will explore users, groups, and policies in the AWS Identity and Access Management (IAM) service.

### Objectives
After completing this lab, you will know how to:
- Explore pre-created IAM Users and Groups.
- Inspect IAM policies as applied to the pre-created groups.
- Follow a real-world scenario, adding users to groups with specific capabilities enabled.
- Locate and use the IAM sign-in URL.
- Experiment with the effects of policies on service access.

### Duration
This lab requires approximately 40 minutes to complete.

### Prerequisites
- Access to the AWS Management Console.

---

## Task 1: Explore the Users and Groups

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
   - On the **Security credentials** tab, notice that **user-1** is assigned a Console password.

5. **Explore User Groups:**
   - In the navigation pane on the left, choose **User groups**.
   - The following groups have been created: **EC2-Admin**, **EC2-Support**, **S3-Support**.

6. **Explore EC2-Support Group:**
   - Choose the **EC2-Support** group to view the summary page.
   - On the **Permissions** tab, notice the managed policy **AmazonEC2ReadOnlyAccess**.
   - Under **Policy Name**, choose the link for **AmazonEC2ReadOnlyAccess**.
   - On the **{} JSON** tab, review the policy JSON.

7. **Explore S3-Support Group:**
   - Choose the **S3-Support** group and view the **Permissions** tab.
   - The policy **AmazonS3ReadOnlyAccess** is attached.
   - Review the policy JSON under **{} JSON**.

8. **Explore EC2-Admin Group:**
   - Choose the **EC2-Admin** group and view the **Permissions** tab.
   - Notice the inline policy **EC2-Admin-Policy**.
   - Review the policy JSON under the **JSON** tab.

---

## Task 2: Add Users to Groups

### Business Scenario
Your company is growing its use of AWS services, and is using many Amazon EC2 instances and Amazon S3 buckets. You want to give access to new staff depending upon their job function.

| User   | In Group     | Permissions                                |
|--------|--------------|--------------------------------------------|
| user-1 | S3-Support   | Read-only access to Amazon S3              |
| user-2 | EC2-Support  | Read-only access to Amazon EC2             |
| user-3 | EC2-Admin    | View, Start, and Stop Amazon EC2 instances |

### Steps to Add Users to Groups

1. **Add user-1 to S3-Support Group:**
   - In the navigation pane on the left, choose **User groups**.
   - Choose the **S3-Support** group.
   - On the **Users** tab, choose **Add users**.
   - Select **user-1** and choose **Add users**.
   - Confirm **user-1** has been added to the group.

2. **Add user-2 to EC2-Support Group:**
   - Follow similar steps as above to add **user-2** to the **EC2-Support** group.

3. **Add user-3 to EC2-Admin Group:**
   - Follow similar steps as above to add **user-3** to the **EC2-Admin** group.

4. **Verify Group Memberships:**
   - In the navigation pane on the left, choose **User groups**.
   - Ensure each group has a "1" in the **Users** column.

---

## Task 3: Sign in and Test Users

### Get the Console Sign-In URL
- In the navigation pane on the left, choose **Dashboard**.
- Copy the **Sign-in URL for IAM users** in this account to a text editor.

### Test User-1 Permissions

1. **Sign in as user-1:**
   - Open a private or incognito window in your browser.
   - Paste the sign-in link and press ENTER.
   - Sign in with the following credentials:
     - IAM user name: `user-1`
     - Password: `Lab-Password1`

2. **Verify S3 Access:**
   - Choose the **Services** menu, and select **S3**.
   - Browse the contents of a bucket to confirm read-only access.

3. **Verify EC2 Access:**
   - Choose the **Services** menu, and select **EC2**.
   - Confirm an error message when accessing instances due to no EC2 permissions.

4. **Sign out user-1:**
   - In the upper-right corner of the page, choose **user-1** and select **Sign Out**.

### Test User-2 Permissions

1. **Sign in as user-2:**
   - Paste the sign-in link into the private browser and press ENTER.
   - Sign in with the following credentials:
     - IAM user name: `user-2`
     - Password: `Lab-Password2`

2. **Verify EC2 Access:**
   - Choose the **Services** menu, and select **EC2**.
   - Confirm read-only access to instances.
   - Attempt to stop an instance and confirm you cannot perform this operation.

3. **Verify S3 Access:**
   - Choose the **Services** menu, and select **S3**.
   - Confirm an error message when accessing S3 due to no S3 permissions.

4. **Sign out user-2:**
   - In the upper-right corner of the page, choose **user-2** and select **Sign Out**.

### Test User-3 Permissions

1. **Sign in as user-3:**
   - Paste the sign-in link into the private browser and press ENTER.
   - Sign in with the following credentials:
     - IAM user name: `user-3`
     - Password: `Lab-Password3`

2. **Verify EC2 Access:**
   - Choose the **Services** menu, and select **EC2**.
   - Confirm you can view and manage instances, including stopping an instance.

---

## Lab Complete
Congratulations! You have completed the lab.