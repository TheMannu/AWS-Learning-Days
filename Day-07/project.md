*****************************************
# Lab 7: Hosting a Static Website

## Lab Overview and Objectives

Static websites have fixed content with no backend processing. They can contain HTML pages, images, style sheets, and all files that are needed to render a website. However, static websites do not use server-side scripting or a database. If you want your static webpages to provide interactivity and run programming logic, you can use JavaScript that runs in the user's web browser.

You can easily host a static website on Amazon Simple Storage Service (Amazon S3) by uploading the content and making it publicly accessible. No servers are needed, and you can use Amazon S3 to store and retrieve any amount of data at any time from anywhere on the web.

### Objectives
After completing this lab, you will know how to:
1. Create a bucket in Amazon S3
2. Upload content to your bucket
3. Enable access to the bucket objects
4. Update the website

### Prerequisites
This lab requires access to the AWS Management Console.

## Task 1: Creating a Bucket in Amazon S3

In this task, you create an S3 bucket and configure it for static website hosting.

1. **Navigate to S3**:
    - In the AWS Management Console, on the Services menu, choose **S3**.

2. **Create a Bucket**:
    - Choose **Create bucket**.
    - For **Bucket name**, enter `website-<123>`, replacing `<123>` with a random number (e.g., `website-456`).

3. **Configure Public Access**:
    - Under **Object Ownership**, choose **ACL enabled**.
    - Choose **Bucket owner preferred**.
    - Under **Block Public Access settings for this bucket**, clear the check box for **Block all public access**, and then select the box that states **I acknowledge that the current settings may result in this bucket and the objects within becoming public**.

4. **Add Tags**:
    - Under **Tags**, select **Add tag** and enter the following:
        - **Key**: Department
        - **Value**: Marketing

5. **Create the Bucket**:
    - Choose **Create bucket**.
    - In the **Buckets** section, choose the name of your new bucket.
    - Choose the **Properties** tab.

6. **Configure Static Website Hosting**:
    - Scroll to the **Static website hosting** panel.
    - Choose **Edit**.
    - Configure the following settings:
        - **Static web hosting**: Choose **Enable**.
        - **Hosting type**: Choose **Host a static website**.
        - **Index document**: Enter `index.html`.
        - **Error document**: Enter `error.html`.
    - Choose **Save changes**.

7. **Access the Website Endpoint**:
    - In the **Static website hosting** panel under **Bucket website endpoint**, choose the link.
    - You should receive a 403 Forbidden message because you have not yet configured the bucket permissions. Keep this tab open in your web browser.

![S3 Console](https://user-images.githubusercontent.com/89054489/232578701-3eaf1e6b-f80f-4544-b0ce-b2919d2fb8d4.png)

## Task 2: Uploading Content to Your Bucket

In this task, you upload the static files to your bucket.

1. **Download Files**:
    - Right-click each of the following links, and download the files to your computer, ensuring that each file keeps the same file name, including the extension.
        - `index.html`
        - `script.js`
        - `style.css`

2. **Upload Files**:
    - Return to the Amazon S3 console, and choose the **Objects** tab.
    - Choose **Upload**.
    - Choose **Add files**.
    - Choose the three files that you downloaded.
    - Choose **Upload**.

![Uploading Files](https://user-images.githubusercontent.com/89054489/232581129-1b93b122-c328-419a-8f0e-22b581e3f08c.png)

## Task 3: Enabling Access to the Objects

Objects that are stored in Amazon S3 are private by default. This can help your organization's data remains secure. In this task, you make the uploaded objects publicly accessible.

1. **Confirm Object Privacy**:
    - Return to the browser tab that showed the 403 Forbidden message.
    - Refresh the webpage. You should still see a 403 Forbidden message.

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