
# Introduction to Amazon S3

In this project, you will learn how to:

- Create a bucket in Amazon S3
- Add an object to a bucket
- Manage access permissions on an object and a bucket
- Create a bucket policy
- Use bucket versioning

## Task 1: Creating a bucket

In Amazon S3 we want to test the features and security of Amazon S3 and configure the environment to hold the Amazon Elastic Compute Cloud (Amazon EC2) report data. 

Every object in Amazon S3 is stored in a bucket, so creating a new bucket to hold the reports is the first thing on our task list.

Our first task is to create a bucket to hold the Amazon EC2 report data. And examine the different bucket configuration options.
To create a bucket in Amazon S3 to hold your Amazon EC2 report data, follow these detailed steps:

   - Sign in to the AWS Management Console.

   - At the upper left of the console, click on the "Services" menu and select "S3" under the "Storage" category.

   - In the Amazon S3 dashboard, click on the "Create bucket" button.

   - In the "Bucket name" field, enter a unique name following the naming conventions (3–63 characters long, consisting of lowercase letters, numbers, or hyphens).

   - Example: `reportbucket123456`. Replace `123456` with a random number to ensure the name is unique.

   - Note: The bucket name must be globally unique across all of Amazon S3 and cannot be changed after creation.

   - Leave the "Region" at its default value or choose a specific region that meets your needs (e.g., latency, cost, regulatory requirements).

   - Review your settings and click on the "Create bucket" button.


![Create Bucket Screenshot](https://user-images.githubusercontent.com/89054489/232216379-08e032ee-74dd-4f50-b9da-92887dbfcc59.png)
![Bucket Configuration Screenshot](https://user-images.githubusercontent.com/89054489/232217093-34333ea2-1a53-402d-8647-6bd887736270.png)
![Bucket Created Screenshot](https://user-images.githubusercontent.com/89054489/232218545-73702a98-526d-4fe4-abf2-aeaa4b3bbb14.png)


## Task 2: Uploading an object to the bucket

Now that we have created a bucket for our `report data`, it's time to work with objects on our S3 bucket.

An object can be any kind of file: a text file, a photo, a video, a zip file and so on.. When we add object to Amazon S3, you have the option to include metadata with the object and set permissions to control accesss to the object.

In this task, we test uploading objects to your reportbucket. We have a screen capture of a daily report and want to upload this image to our S3 bucket.

1. Download the new-report.png file to your desktop from the provided link.
2. Go to the S3 Management Console and select your bucket (reportbucket).
3. Choose Upload and follow the wizard to upload the new-report.png file.
4. Once uploaded successfully, close the Upload status window.

![Upload Object Screenshot 1](https://user-images.githubusercontent.com/89054489/232222798-faaa641f-c5a8-4c95-988d-b6e84c09c94f.png)
![Upload Object Screenshot 2](https://user-images.githubusercontent.com/89054489/232222635-c8dd6d73-d05b-4557-b265-57fc48c2c745.png)

![Upload Success Screenshot 1](https://user-images.githubusercontent.com/89054489/232222894-6bbaa1b1-620b-4fc4-9d83-5a40869f30bf.png)
![Upload Success Screenshot 2](https://user-images.githubusercontent.com/89054489/232222957-56baf536-d8de-4765-9fbd-06ff1c9649db.png)

## Task 3: Making an object public

Security is a priority in Amazon S3. Before configuring the EC2 instance to connect to the reportbucket, we will test the bucket and object settings for security.

In this task, we configure permissions on your bucket and object to test accessibility.

1. **Confirm the Object is Private by Default**:
   - In the S3 Management Console, navigate to `reportbucket`.
   - On the "Objects" tab, locate and click on the `new-report.png` file name.
   - In the "Object overview" section, copy the "Object URL" link (e.g., `https://reportbucket8877.s3-us-west-2.amazonaws.com/new-report.png`).
   - Open a new browser tab, paste the URL into the address field, and press Enter.
   - We should receive an "Access Denied" error, confirming that objects in Amazon S3 are private by default.

2. **Enable ACLs for The Bucket**:
     Return to the S3 Management Console and navigate back to the main `reportbucket` overview page.
   - Choose the "Permissions" tab.
   - Under "Object Ownership", click "Edit".
   - Select "ACLs enabled" and choose "Bucket owner preferred".
   - Check the box for "I acknowledge that ACLs will be restored" and click "Save changes".

3. **Modify Block Public Access Settings**:
   - Still on the "Permissions" tab, under "Block public access (bucket settings)", click "Edit".
   - Clear the check box for the "Block all public access" option, leaving the other options cleared.
   - Click "Save changes".
   - In the confirmation dialog box, type `confirm` and click "Confirm".
   - A message saying "Successfully edited Block Public Access settings for this bucket" should appear.

4. **Make the Object Public**:
   - Go back to the "Objects" tab and click on the `new-report.png` file name.
   - In the upper right, click the "Object actions" dropdown menu and select "Make public".
   - Read the warning about public read access and then click "Make public".
   - A green banner saying "Successfully edited public access" will appear.

5. **Verify Public Accessibility**:
   - Return to the browser tab with the "Access Denied" message and refresh the page.
   - The `new-report.png` object should now display properly, indicating it is publicly accessible.
   - Close the browser tab displaying the `new-report.png` image.



We have successfully tested and configured the permissions of our S3 bucket and object, confirming that objects are private by default and learning how to make them publicly accessible when needed.

In the next task, we will configure the EC2 instance to connect to the S3 bucket to confirm connectivity and further test the setup. This will involve setting up proper IAM roles and policies to securely access S3 bucket from EC2 instance.

![Object Permissions Screenshot 1](https://user-images.githubusercontent.com/89054489/232223720-5c63e347-33d4-465a-8994-0ea9e81596c0.png)
![Object Permissions Screenshot 2](https://user-images.githubusercontent.com/89054489/232223951-d6318ed0-9e34-4c6c-be70-8ccbc6f3ad06.png)
![Object Permissions Screenshot 3](https://user-images.githubusercontent.com/89054489/232224072-b81cb65b-52ce-4968-90d1-f946d1b7bdff.png)
![Object Permissions Screenshot 4](https://user-images.githubusercontent.com/89054489/232232431-7a4f1284-2a43-49d5-a786-f063495cac6b.png)
![Object Permissions Screenshot 5](https://user-images.githubusercontent.com/89054489/232232310-8b82e65f-3824-4483-94dc-b823db944d1b.png)
![Object Permissions Screenshot 6](https://user-images.githubusercontent.com/89054489/232232342-6812ccc6-911d-49a4-a4af-4eec1372f0bb.png)
![Object Permissions Screenshot 7](https://user-images.githubusercontent.com/89054489/232232703-413d64c3-7c27-4010-ace2-d2f68fbb68dc.png)
![Object Permissions Screenshot 8](https://user-images.githubusercontent.com/89054489/232232723-76bde136-9d17-4a47-a0e6-5e189567b1ee.png)
![Object Permissions Screenshot 9](https://user-images.githubusercontent.com/89054489/232232747-21f41b9d-344d-4b67-b1d6-6d4c11779e0d.png)
![Object Permissions Screenshot 10](https://user-images.githubusercontent.com/89054489/232232780-41778cbb-a915-4183-ad63-c41f0b13bdb6.png)

## Task 4: Testing connectivity from the EC2 instance

In this task, we'll connect to the EC2 instance to test connectivity and security to the Amazon S3 bucket. We'll verify that we can list and read objects but not write, which requires adjusting permissions.

**Connect to Your EC2 Instance**:
   - In the AWS Management Console, navigate to "EC2" under the "Services" menu.
   - In the "EC2 Dashboard", under "Resources", choose "Instances (running)".
   - Select the check box for "Bastion Host" and click "Connect".
   - In the "Connect to instance" window, select the "Session Manager" tab and choose "Connect".

   *With AWS Systems Manager Session Manager, one can connect to the bastion host instance without the need for specific ports to be open on  firewall or Amazon Virtual Private Cloud (Amazon VPC) security group. Refer to AWS Systems Manager Session Manager in the Additional resources section*

   - A new browser tab or window will open, providing a connection to the bastion host instance.

   *We are now connected to the EC2 instance that holds the reporting application. Because Session Manager uses HTTPS port 443, it does not requires to open SSH port 22 to the outside world. Now we will see how EC2 interacts with your S3 bucket.*

**Navigate to Home Directory**:
   - Enter the following command to change to the home directory:
     ```
     cd ~
     ```
   - Verify that you are in the home directory by entering:
     ```
     pwd
     ```
   - The output should be:- `/home/ssm-user`

**List All S3 Buckets:**
   - Now in the ssm-user's home directory where we will run all of the commands
   
   - Enter the command to list all your S3 buckets:
     
     ``` 
     aws s3 ls 
     ```
     
   - The output should include your bucket, such as:
     `2023-09-12 23:31:36 reportbucket8877 `

*Note: During the creation of the environment, both an instance profile (which defines who you are for authentication) and a role (which defines what you can do after  authentication) have been automatically added for the EC2 instance to allow the EC2 instance to list the S3 buckets and objects.*
   
**List Objects in Your S3 Bucket:**
   - Enter the command to list all objects in your specific bucket (replace `8877` with your actual bucket number):
     ```
     aws s3 ls s3://reportbucket8877
     ```
   - The output should list your object:`2020-09-12 15:36:25 52647 new-report.png`

   There is currently only one object in your bucket. The object is called new-report.png.
     
**Change to the Reports Directory:**
   - To change the `reports` directory:
     ```
     cd reports
     ```
   - List the contents of the directory:
     ```
     ls
     ```
   - The output should list several files:
     `dolphins.jpg files.zip report-test.txt report-test1.txt report-test2.txt report-test3.txt whale.jpg`

**Attempt to Copy a File to the S3 Bucket**:

   - To copy a file to the S3 bucket:
      ```
      aws s3 cp report-test1.txt s3://reportbucket8877
      ```
   - You should see an output indicating an upload failed error due to insufficient permissions:
      `  upload failed: ./report-test1.txt to s3://reportbucket8877/report-test1.txt An error occurred (AccessDenied) when calling the PutObject operation: Access Denied  `

   The output indicates an upload failed error. This error occurs because we have read-only rights to the bucket and do not have the permissions to perform the PutObject action.

   Leave this window open. and go back to browser tab with the AWS console. In the next task, you create a bucket policy to add the PutObject permission.
![Instance](https://user-images.githubusercontent.com/89054489/232232900-b75913e9-18cc-4388-b65c-053ed3ca079b.png)
![Connect](https://user-images.githubusercontent.com/89054489/232232980-b9e6bae6-6e41-43c4-91f1-8e96bf74ebcf.png)
![Commands](https://user-images.githubusercontent.com/89054489/232233262-d61f148e-8cc1-49b5-b8a6-b1f8d8ab986c.png)

## Task 5: Creating a bucket policy
*A bucket policy is a set of permissions associated with an S3 bucket. It is used to control access to an entire bucket or to specific directories within a bucket.*

In this task, we use the AWS Policy Generator to create a bucket policy to enable read and write access from the EC2 instance to the bucket so that the reporting application can successfully write to Amazon S3.

**Download the Sample File**:
   - Right-click this link:(sample-file.txt) and choose "Save link as" to download the sample file to your desktop.

**Navigate to S3 Management Console**:
   - Go to the AWS Management Console and select the S3 service.

**Upload the Sample File**:
   - Select your bucket (e.g., reportbucket8877).
   - Choose "Upload" and follow the upload process to add the sample-file.txt to our bucket.

**Copy Object URL**:
   - After uploading, go to the overview page of the reportbucket,choose the sample-file.txt file name in bucket.
   - Under the Object overview section, locate and copy the Object URL link.

**Verify Access Denied**:
   - Open a new browser tab and paste the Object URL link.
   - Once again, browser displays an Access Denied message since the bucket doesn't have public access.

We need to configure a bucket policy to grant access to all objects in the bucket without having to specify permissions on each object individually.

**Prepare Role ARN**:
   - Go back to the AWS Management Console and navigate to IAM under Services.
   - In the Roles section, search for and select the EC2InstanceProfileRole.
   This is the role that EC2 use to connect to Amazon S3
   - Copy the Role ARN to a text file for later use. It should look like : arn:aws:iam::xxxxxxxxxxxx:role/EC2InstanceProfileRole

**Generate Bucket ARN**:
   - Return to the S3 Management Console and select your bucket.
   - Go to the Permissions tab and click on Edit in the Bucket policy section.
   - Choose Edit A blank Bucket policy editor. 
   - We can create bucket policies manually, or can create them with the assistance of the AWS Policy Generator.
   - Find the Bucket ARN and copy it to a text file.

**Use AWS Policy Generator**:

*Amazon Resource Names (ARNs) uniquely identify AWS resources across all of AWS. A colon (:) separates each section of the ARN, and each section represents a specific piece of the path to the specified resource.The sections can vary slightly depending on the service being referenced but generally follow the format: `arn:partition:service:region:account-id:resource`

Amazon S3 does not require Region or account-id parameters in ARNs, so those sections are left blank. However, the colon (:) to separate the sections is still used, so it looks similar to arn:aws:s3:::reportbucket8877

Refer to the Amazon Resource Names (ARNs) and AWS Service Namespaces documentation link in the Additional resources section for more information.

   - Click on "Policy generator" to open the AWS Policy Generator in a new tab.
   - Find the Bucket ARN and copy it to a text file.

**Configure Policy Generator**:
   - Select "S3 Bucket Policy" as the type of policy.
   - Set Effect to "Allow".
   - Paste the EC2 Role ARN you copied earlier into the Principal field.
   - Keep AWS Service as default "Amazon S3".
   - Select actions like GetObject and PutObject.
   - For ARN, enter `*` to apply the policy to all resources in the bucket.
   - Choose Add statement :- The details of the statement you configured are added to a table below the button. You can add multiple statements to a policy.
   - Choose Generate Policy:-A new window displays the generated policy in JSON format. 

   *{ "Version": "2012-10-17", "Id": "Policy1604361694227", "Statement": [ { "Sid": "Stmt1604361692117", "Effect": "Allow", "Principal": { "AWS": "arn:aws:iam::416159072693:role/EC2InstanceProfileRole" }, "Action": [ "s3:GetObject", "s3:PutObject" ], "Resource": "*" } ] }*


**Copy and Apply Policy**:
    - Copy the generated policy in JSON format.
    - Close the Policy Generator tab and return to the Bucket policy editor in the S3 Management Console.
    - Paste the generated policy into the editor.
    - Update the Resource value with your Bucket ARN followed by `/*` (e.g., "Resource":"arn:aws:s3:::reportbucket8877/*").
    - Save the changes.

**Verify Access**:

Return to the AWS Systems Manager (Systems Manager) window. If your session has timed out, reconnect to Systems Manager using the previous steps in the lab. Enter the following command to verify that you are in the /home/ssm-user/reports directory. pwd The output should be as follows:`/home/ssm-user/reports`

   **Varify PutObject**
   - To list all objects in your reportbucket:-
   ```
   aws s3 ls s3://reportbucket8877
   ```
   The output returns a list of files. 

   - To copying the report-test1.txt file to the S3 bucket. 
   ```
   aws s3 cp report-test1.txt s3://reportbucket8877
   ```
  
   - To check if files successfully uploaded to S3 
   ```
   aws s3 ls s3://reportbucket8877
   ```
   The output returns list of files including `report-test1.txt` file.

   **We have successfully uploaded (PutObject) a file from the EC2 instance to the S3 bucket.**

   **Varify GetObject**

   - Enter command to retrieve (GetObject) a file from Amazon S3 to the EC2 instance. 
   ```
   aws s3 cp s3://reportbucket8877/sample-file.txt sample-file.txt
   ```
   Enter the command to check if file is in `/reports`
   ```
   ls
   ```
   Return list of files including `sample-file.txt`

   **We successfully uploaded and retieved a file from Amazon EC2 to S3 bucket**

**Additional Policy**

   - Go back to the browser tab with the Access Denied error for sample-file.txt and refresh the page.The page still displays an error message because the bucket policy gave rights to only the principal called EC2InstanceProfileRole.

   - Go to the AWS Policy Generator, and add another statement To allow everyone read access, add another statement to the bucket policy with Principal as "*" and Action as GetObject.
   ```
     {
        "Sid": "Stmt1604428842806",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::reportbucket987987/*"
      }
   ```
   This policy allows the EC2InstanceProfileRole to have access to the bucket while giving everyone access to read the objects via the browser. Below is an expample of the above:

- Go to browser with the Access Denied error and refresh it. If you can read the text, then Policy was successful. If not, look at the following policy for help. 
   
   - The modified policy should look like the following policy. Notice that there are two statements: one with the EC2InstanceProfileRole and one where the principal is "*" for everyone.

   

By following these steps, you'll be able to create a bucket policy that allows specific access rights to your Amazon S3 bucket.

In the next section, you explore how to keep copies of files to prevent against accidental deletion.

*Images references for task - 5*
![image](https://user-images.githubusercontent.com/89054489/232256444-cf516c6c-aab1-4653-b33e-194b43bbe9b8.png)
![image](https://user-images.githubusercontent.com/89054489/232233567-fb017920-b99b-4c64-af79-f511dcc1cb22.png)
![image](https://user-images.githubusercontent.com/89054489/232256468-04c6a408-54e0-469e-8379-56be3819f4a0.png)
![image](https://user-images.githubusercontent.com/89054489/232256509-e281940b-1a53-4348-b5f2-05c0390ba921.png)
![image](https://user-images.githubusercontent.com/89054489/232256559-141ee783-e6ee-4f80-a376-1dcf221c63d6.png)
![image](https://user-images.githubusercontent.com/89054489/232256610-74275ddd-33a9-4cba-a78d-a6c835571bae.png)
![image](https://user-images.githubusercontent.com/89054489/232256658-9f9d0d47-8d30-4d00-9400-a327688ebf31.png)
![image](https://user-images.githubusercontent.com/89054489/232256760-ca2318f4-cc51-4743-ae03-5964dee0d6d0.png)
![image](https://user-images.githubusercontent.com/89054489/232256861-d163516d-6e8f-48ac-ba75-290784c9a8e8.png)
![image](https://user-images.githubusercontent.com/89054489/232256872-a62c62e1-659c-45ec-b20e-d46e80d7d2c7.png)
![image](https://user-images.githubusercontent.com/89054489/232258066-fbd7d116-e5af-4eda-93e8-7303f6e963d5.png)
![image](https://user-images.githubusercontent.com/89054489/232258031-91f27742-06c3-4e1f-89ab-c4a9768ca400.png)
![image](https://user-images.githubusercontent.com/89054489/232258086-be7199f0-2d53-4ee1-8aac-625ee9a276c2.png)


## Task 6: Exploring versioning on Amazon S3:

Versioning is a means of keeping multiple variants of an object in the same bucket. We use versioning to preserve, retrieve, and restore every version of every object stored in your S3 bucket. With versioning, we can easily recover from both unintended user actions and application failures.

For auditing and compliance reasons, we need to enable versioning on our reportbucket. Versioning should protect the reports in the reportbucket against accidental deletion. In this task, we enable versioning and test the feature by uploading a modified version of the sample-file.txt file from the previous task.

**Enable Versioning**:
   - Navigate to S3 bucket created earlier .
   - Go to the Properties tab.
   - Under Bucket Versioning, click Edit, select Enable, and then click Save changes.

*Versioning is enabled for an entire bucket and all objects within the bucket. It cannot be enabled for individual objects.*

There are also cost considerations when enabling versioning. Refer to the Additional resources section for more information.

![Enable Versioning](https://user-images.githubusercontent.com/89054489/232258249-2571b5f7-9407-4f3b-b19c-438f35ccdde7.png)
![Enable Versioning](https://user-images.githubusercontent.com/89054489/232258201-6b37d8d7-eddc-455d-ae1d-90f4d6d916a8.png)
![Enable Versioning](https://user-images.githubusercontent.com/89054489/232258275-0fd29eb2-c1e1-443c-9cea-afc9581fa536.png)


**Download Modified Sample File**:
   - Right-click this `sample-file.txt` and save the text file to your computer with the same name as before (sample-file.txt).Although this file has the same name as the previous file, it contains new text.

**Upload Modified File**:
   - Go to the Objects tab in your bucket.
   - Click on Show versions.
   - Choose Upload and upload the modified sample-file.txt file.

![Upload Modified File](https://user-images.githubusercontent.com/89054489/232293636-7853b950-53a3-4978-94e0-9eba3490b750.png)

**Verify Versions**:
   - Refresh the page or click Show versions again.
   - You'll see multiple versions of the sample-file.txt file, including the new one you uploaded.

**Access Previous Versions**:

- Go to the Versions tab of the sample-file.txt file.
- Select an older version (not the latest) and click Open.
- You'll see the original version of the file.

However,If we try to access the older version of the sample-file.txt file using the object URL link, we will receive an access denied message. This message is expected because the bucket policy created in the previous task allows permission to access only the latest version of the object. In order to access a previous version of the object, we need to update the bucket policy to include the s3:GetObjectVersion permission.

```
"Action": [ "s3:GetObject", "s3:GetObjectVersion" ]
```

- Choose the link for the bucket name at the upper left to return to the bucket overview tab. 
- Locate the Show versions option, and toggle the button to on to show the versions. 
- Now we can view the available versions of each object and identify which version is the latest. 
*Notice that the new-report.png object has only one version. The version ID is null because the object was uploaded before versioning was enabled on this bucket.*
*Also we can now choose the version name link to navigate directly to that version of the object in the console.*


**Delete an Object**:
   - Navigate to the S3 Management Console.
   - Select your bucket (e.g., `reportbucket8877`).
   - Ensure the `Show versions` toggle is off to view the default object list.
   - Select the checkbox next to `sample-file.txt`.
   - Click the "Delete" button at the top.
   - On the Delete objects page, type `delete` in the confirmation box and click the "Delete objects" button.
   - Click "Close" in the upper right corner to return to the bucket overview.
   - Verify that `sample-file.txt` is no longer displayed.

**Restore a Deleted Object Using Versioning**:
   - Locate the `Show versions` option and toggle it on.
   - Notice `sample-file.txt` reappears with a Delete marker, and previous versions are listed.
   - Select the checkbox for the version of `sample-file.txt` with the Delete marker.
   - Click the "Delete" button.
   - On the Permanently delete objects window, type `permanently delete` in the confirmation box and click the "Delete objects" button.
   - Click "Close" to return to the bucket overview.
   - Toggle `Show versions` off to return to the default object view.
   - Verify that `sample-file.txt` is restored in the bucket.

![Permanently Delete](https://user-images.githubusercontent.com/89054489/232294043-134c6e6e-1c5f-46aa-abbf-da58945b1089.png)

**Delete a Specific Version of an Object**:
   - Toggle `Show versions` on to display all versions.
   - You should see two versions of `sample-file.txt`.
   - Select the checkbox for the latest version of `sample-file.txt`.
   - Click the "Delete" button.
   - On the Permanently delete objects window, type `permanently delete` in the confirmation box and click the "Delete objects" button.
   - Click "Close" to return to the bucket overview.
   - Verify that only one version of `sample-file.txt` remains.

**Verify Object URL**:
   - Toggle `Show versions` off to return to the default object view.
   - Click on the `sample-file.txt` file name.
   - On the sample-file.txt overview page, copy the Object URL link displayed at the bottom.
   - Open a new browser tab, paste the link into the address field, and press Enter.
   - The browser should display the text of the original version of `sample-file.txt`.

**Summary**

We have successfully created an S3 bucket for our company to use to store report data from your EC2 instance. We created a bucket policy so that the EC2 instance can PutObjects and GetObject from the reportbucket, and successfully tested uploading and downloading files from the EC2 instance to test the bucket policy. We have enabled versioning on the S3 bucket to protect against accidental object deletion. And have successfully completed the configuration for your EC2 reportbucket.