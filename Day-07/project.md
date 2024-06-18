*****************************************
# Hosting a Static Website

## Overview

Static websites have fixed content with no backend processing. They can contain HTML pages, images, style sheets, and all files that are needed to render a website. However, static websites do not use server-side scripting or a database. If we want the static webpages to provide interactivity and run programming logic, we can use JavaScript that runs in the user's web browser.

We can easily host a static website on Amazon Simple Storage Service (Amazon S3) by uploading the content and making it publicly accessible. No servers are needed, and we can use Amazon S3 to store and retrieve any amount of data at any time from anywhere on the web.

### Objectives
After completing this task, we will learn how to:

1. Create a bucket in Amazon S3
2. Upload content to your bucket
3. Enable access to the bucket objects

4. Update the website


## Task 1: Creating a Bucket in Amazon S3

In this task, we create an S3 bucket and configure it for static website hosting.

1. **Navigate to S3**:
    - In the AWS Management Console, on the Services menu, choose **S3**.

2. **Create a Bucket**:
    - Choose **Create bucket**.

    *An S3 bucket name is globally unique, and all AWS accounts share the namespace. After you create a bucket, no other AWS accounts in any AWS Regions can use the name of that bucket unless you delete the bucket.*

    - For **Bucket name**, enter `website-<123>`, replacing `<123>` with a random number (e.g., `website-456`).

3. **Configure Public Access**:

    *Public access to buckets is blocked by default. Because the files in static website will need to be accessible through the internet, we must permit public access.*

    - Under **Object Ownership**, choose **ACL enabled**.
    - Choose **Bucket owner preferred**.
    - Under **Block Public Access settings for this bucket**, clear the check box for **Block all public access**, and then select the box that states **I acknowledge that the current settings may result in this bucket and the objects within becoming public**.

4. **Add Tags**:
    - Under **Tags**, select **Add tag** and enter the following:
        - **Key**: Department
        - **Value**: Marketing

        *We can use tags to add additional information to a bucket, such as a project code, cost center, or owner.*

5. **Create the Bucket**:
    - Choose **Create bucket**.
    - In the **Buckets** section, choose the name of new bucket.
    - Choose the **Properties** tab.

6. **Configure the Bucket for Static Website Hosting**:
    - Scroll to the **Static website hosting** panel.
    - Choose **Edit**.
    - Configure the following settings:
        - **Static web hosting**: Choose **Enable**.
        - **Hosting type**: Choose **Host a static website**.
        - **Index document**: Enter `index.html`.
        *Note: We must enter this value even though it is already displayed.*
        - **Error document**: Enter `error.html`.
    - Choose **Save changes**.

7. **Access the Website Endpoint**:
    - In the **Static website hosting** panel under **Bucket website endpoint**, choose the link.
    - We should receive a 403 Forbidden message because we have not yet configured the bucket permissions. Keep this tab open in web browser to return later.

#### We have successfully configured the bucket to host a static website.


**Images For Reference**

![S3 Console](https://user-images.githubusercontent.com/89054489/232578701-3eaf1e6b-f80f-4544-b0ce-b2919d2fb8d4.png)
![](https://user-images.githubusercontent.com/89054489/232578939-ec18c2a7-6d61-46b7-beb7-171baad28f8d.png)
![alt text](https://user-images.githubusercontent.com/89054489/232579149-185d02bc-7c29-48aa-b889-f3436a9240d6.png)
![alt text](https://user-images.githubusercontent.com/89054489/232579245-555970e0-8db4-4039-b912-391657145f9e.png)
![alt text](https://user-images.githubusercontent.com/89054489/232579376-d436d301-b3e3-4c16-9de3-5219e3f857b3.png)
![alt text](https://user-images.githubusercontent.com/89054489/232579668-fd86122e-1469-43d6-929f-25ceaca224e3.png)
![alt text](https://user-images.githubusercontent.com/89054489/232580067-89b89603-a9d0-4a59-a351-5f4b44247494.png)
![alt text](https://user-images.githubusercontent.com/89054489/232580275-6df63989-3c51-4a68-ab0b-5a3931f04200.png)
![alt text](https://user-images.githubusercontent.com/89054489/232580987-d3ff2ebf-d9f5-47ae-8fb6-adff0ae62f96.png)


## Task 2: Uploading Content to Your Bucket

In this task, we will upload the static files to our bucket.

1. **Download Files**:
    - Upload the files to computer, ensuring that each file keeps the same file name, including the extension.
        - `index.html`
        - `script.js`
        - `style.css`

2. **Upload Files**:
    - Return to the Amazon S3 console, and choose the **Objects** tab.
    - Choose **Upload**.
    - Choose **Add files**.
    - Choose the three files to uploaded.
    - Choose **Upload**.

**Images for Reference**
![alt text](https://user-images.githubusercontent.com/89054489/232580707-1553fcf5-6261-4ade-a2ff-f61d6f008bb0.png)
![Uploading Files](https://user-images.githubusercontent.com/89054489/232581129-1b93b122-c328-419a-8f0e-22b581e3f08c.png)
![alt text](https://user-images.githubusercontent.com/89054489/232581662-2af6520d-2d6f-4e10-86f5-df08f9872f40.png)


## Task 3: Enabling Access to the Objects

Objects that are stored in Amazon S3 are private by default. This can help the organization's data remains secure. In this task, We will make the uploaded objects publicly accessible.

1. **Confirm Object are Currently Private**:
    - Return to the browser tab that showed the 403 Forbidden message.
    - Refresh the webpage. It should still a 403 Forbidden message.
    - This response is expected! This message indicates that the static website is being hosted by Amazon S3 but that the content is private.

2. **Make Objects Public**:
    - Return to the web browser tab with the Amazon S3 console.
    - Select all three objects.
    - In the **Actions** menu, choose **Make public**.
    - A list of the three objects is displayed.
    - Choose **Make public**.

3. **Verify Public Access**:
    - Return to the web browser tab with the 403 Forbidden message.
    - Refresh the webpage. You should now see the static website that is being hosted by Amazon S3.

![Making Objects Public](https://user-images.githubusercontent.com/89054489/232581495-b15a7ca8-3705-4940-9ce5-a4f436e2c3e0.png)

## Task 4: Updating the Website

You can change the website by editing the HTML file and uploading it again to the S3 bucket.

1. **Edit HTML File**:
    - On your computer, load the `index.html` file into a text editor (for example, Notepad or TextEdit).
    - Find the text **Served from Amazon S3**, and replace it with **Created by <YOUR-NAME>**, substituting your name for `<YOUR-NAME>` (e.g., **Created by Jane**).
    - Save the file.

2. **Upload the Updated File**:
    - Return to the Amazon S3 console, and upload the `index.html` file that you just edited.
    - Select `index.html`, and in the **Actions** menu, choose the **Make public** option again.

3. **Verify the Update**:
    - Return to the web browser tab with the static website, and refresh the page. Your name should now be on the page.

Your static website is now accessible on the internet. Because it is hosted on Amazon S3, the website has high availability and can serve high volumes of traffic without using any servers.

You can also use your own domain name to direct users to a static website that is hosted on Amazon S3. To accomplish this, you could use the Amazon Route 53 Domain Name System (DNS) service in combination with Amazon S3.

![Updated Website]()

## Lab Complete 
Congratulations! You have completed the lab.