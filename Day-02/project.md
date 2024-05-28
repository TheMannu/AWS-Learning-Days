
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

Now that you have created a bucket, it's time to upload an object (e.g., a daily report image) to your S3 bucket.

1. Download the new-report.png file to your desktop from the provided link.
2. Go to the S3 Management Console and select your bucket (reportbucket).
3. Choose Upload and follow the wizard to upload the new-report.png file.
4. Once uploaded successfully, close the Upload status window.

![Upload Object Screenshot 1](https://user-images.githubusercontent.com/89054489/232222798-faaa641f-c5a8-4c95-988d-b6e84c09c94f.png)
![Upload Object Screenshot 2](https://user-images.githubusercontent.com/89054489/232222635-c8dd6d73-d05b-4557-b265-57fc48c2c745.png)

![Upload Success Screenshot 1](https://user-images.githubusercontent.com/89054489/232222894-6bbaa1b1-620b-4fc4-9d83-5a40869f30bf.png)
![Upload Success Screenshot 2](https://user-images.githubusercontent.com/89054489/232222957-56baf536-d8de-4765-9fbd-06ff1c9649db.png)

## Task 3: Making an object public

In this task, you configure permissions on your bucket and object to test accessibility.

1. Navigate to your bucket and select the new-report.png object.
2. Copy the Object URL link and attempt to access it (Access Denied error).
3. Configure permissions by allowing ACLs and editing Block public access settings.
4. Make the object public and verify accessibility.

![Object Permissions Screenshot 1](https://user-images.githubusercontent.com/89054489/232223720-5c63e347-33d4-465a-8994-0ea9e81596c0.png)
![Object Permissions Screenshot 2](https://user-images.githubusercontent.com/89054489/232223951-d6318ed0-9e34-4c6c-be70-8ccbc6f3ad06.png)
![Object Permissions Screenshot 3](https://user-images.githubusercontent.com/89054489/232224072-b81cb65b-52ce-4968-90d1-f946d1b7bdff.png)

## Task 4: Testing connectivity from the EC2 instance

Connect to your EC2 instance to test connectivity and security to the Amazon S3 reportbucket.

1. Sign in to the AWS Management Console and navigate to EC2.
2. Select your running EC2 instance (Bastion Host) and choose Connect.
3. Connect using Session Manager to the bastion host instance.
4. Run commands to list S3 buckets, list objects, and attempt file uploads.

![EC2 Connectivity Screenshot 1](https://user-images.githubusercontent.com/89054489/232232431-7a4f1284-2a43-49d5-a786-f063495cac6b.png)

![EC2 Connectivity Screenshot 2](https://user-images.githubusercontent.com/89054489/232232310-8b82e65f-3824-4483-94dc-b823db944d1b.png)
![EC2 Connectivity Screenshot 3](https://user-images.githubusercontent.com/89054489/232232342-6812ccc6-911d-49a4-a4af-4eec1372f0bb.png)
![EC2 Connectivity Screenshot 4](https://user-images.githubusercontent.com/89054489/232232703-413d64c3-7c27-4010-ace2-d2f68fbb68dc.png)
![EC2 Connectivity Screenshot 5](https://user-images.githubusercontent.com/89054489/232232723-76bde136-9d17-4a47-a0e6-5e189567b1ee.png)
![EC2 Connectivity Screenshot 6](https://user-images.githubusercontent.com/89054489/232232747-21f41b9d-344d-4b67-b1d6-6d4c11779e0d.png)
![EC2 Connectivity Screenshot 7](https://user-images.githubusercontent.com/89054489/232232780-41778cbb-a915-4183-ad63-c41f0b13bdb6.png)

**Task 5: Creating a bucket policy**

Sure, I can guide you through the process of creating a bucket policy for Amazon S3 step by step.

### Task 5: Creating a bucket policy

1. **Download the Sample File**:
   - Right-click this [link](sample-file.txt) and choose "Save link as" to download the sample file to your desktop.

2. **Navigate to S3 Management Console**:
   - Go to the AWS Management Console and select the S3 service.

3. **Upload the Sample File**:
   - Select your bucket (e.g., reportbucket987987).
   - Choose "Upload" and follow the upload process to add the sample-file.txt to your bucket.

4. **Copy Object URL**:
   - After uploading, go to the overview page of the sample-file.txt in your bucket.
   - Copy the Object URL link.

5. **Verify Access Denied**:
   - Open a new browser tab and paste the Object URL link.
   - You should see an Access Denied message since the bucket doesn't have public access.

6. **Prepare Role ARN**:
   - Go back to the AWS Management Console and navigate to IAM under Services.
   - In the Roles section, search for and select the EC2InstanceProfileRole.
   - Copy the Role ARN to a text file for later use.

7. **Generate Bucket ARN**:
   - Return to the S3 Management Console and select your bucket.
   - Go to the Permissions tab and click on Edit in the Bucket policy section.
   - Find the Bucket ARN and copy it to a text file.

8. **Use AWS Policy Generator**:
   - Click on "Policy generator" to open the AWS Policy Generator in a new tab.

9. **Configure Policy Generator**:
   - Select "S3 Bucket Policy" as the type of policy.
   - Set Effect to "Allow".
   - Paste the EC2 Role ARN you copied earlier into the Principal field.
   - Keep AWS Service as "Amazon S3".
   - Select actions like GetObject and PutObject.
   - For ARN, enter `*` to apply the policy to all resources in the bucket.
   - Add the statement and generate the policy.

10. **Copy and Apply Policy**:
    - Copy the generated policy in JSON format.
    - Close the Policy Generator tab and return to the Bucket policy editor in the S3 Management Console.
    - Paste the generated policy into the editor.
    - Update the Resource value with your Bucket ARN followed by `/*` (e.g., "arn:aws:s3:::reportbucket987987/*").
    - Save the changes.

11. **Verify Access**:
    - Go back to the browser tab with the Access Denied error for sample-file.txt and refresh the page.
    - If you can now access the file, your policy was successful.

12. **Additional Policy (Optional)**:
    - To allow everyone read access, add another statement to the bucket policy with Principal as "*" and Action as GetObject.
    - Generate this policy and add it to the Bucket Policy Editor if needed.

By following these steps, you'll be able to create a bucket policy that allows specific access rights to your Amazon S3 bucket.

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


Sure, here is a step-by-step guide with images for Task 6: Exploring versioning on Amazon S3:

1. **Enable Versioning**:
   - Navigate to your S3 bucket (e.g., reportbucket987987).
   - Go to the Properties tab.
   - Under Bucket Versioning, click Edit, select Enable, and then click Save changes.

![Enable Versioning](image-link)

2. **Download Modified Sample File**:
   - Right-click this [link](sample-file.txt) and save the text file to your computer with the same name as before (sample-file.txt).

3. **Upload Modified File**:
   - Go to the Objects tab in your bucket.
   - Click on Show versions.
   - Choose Upload and upload the modified sample-file.txt file.

![Upload Modified File](image-link)

4. **Verify Versions**:
   - Refresh the page or click Show versions again.
   - You'll see multiple versions of the sample-file.txt file, including the new one you uploaded.

![Verify Versions](image-link)

5. **Access Previous Versions**:
   - Go to the Versions tab of the sample-file.txt file.
   - Select an older version (not the latest) and click Open.
   - You'll see the original version of the file.

![Access Previous Versions](image-link)

6. **Delete and Restore Versions**:
   - Delete the sample-file.txt file from the default object view.
   - Show versions again and notice the Delete marker for the latest version.
   - Permanently delete the version with the Delete marker.
   - The file is restored to its previous state without the Delete marker.

![Delete and Restore Versions](image-link)

7. **Permanently Delete a Version**:
   - Show versions and select a specific version of the sample-file.txt file.
   - Permanently delete that version to remove it entirely.

![Permanently Delete Version](image-link)

8. **Access Original Version**:
   - Copy the Object URL link of the sample-file.txt file from the overview page.
   - Paste the link in a new browser tab to view the original version of the file.

![Access Original Version](image-link)

By following these steps, you can explore versioning on Amazon S3, including enabling versioning, uploading and managing multiple versions of files, restoring previous versions, and permanently deleting specific versions.
![image](https://user-images.githubusercontent.com/89054489/232258249-2571b5f7-9407-4f3b-b19c-438f35ccdde7.png)
![image](https://user-images.githubusercontent.com/89054489/232258201-6b37d8d7-eddc-455d-ae1d-90f4d6d916a8.png)
![image](https://user-images.githubusercontent.com/89054489/232258275-0fd29eb2-c1e1-443c-9cea-afc9581fa536.png)
![image](https://user-images.githubusercontent.com/89054489/232293636-7853b950-53a3-4978-94e0-9eba3490b750.png)
![image](https://user-images.githubusercontent.com/89054489/232294043-134c6e6e-1c5f-46aa-abbf-da58945b1089.png)
![image](https://user-images.githubusercontent.com/89054489/232294637-195ef657-0201-43c3-a439-59c5457f46d3.png)


**Summary**
you have successfully created an S3 bucket for your company to use to store report data from your EC2 instance. you created a bucket policy so that the EC2 instance can PutObjects and GetObject from the reportbucket, and you successfully tested uploading and downloading files from the EC2 instance to test the bucket policy. you have enabled versioning on the S3 bucket to protect against accidental object deletion. you have successfully completed the configuration for your EC2 reportbucket. Congratulations!

