# Lab 3: Introduction to Amazon DynamoDB

Amazon DynamoDB is a fast and flexible NoSQL database service designed for applications requiring consistent, single-digit millisecond latency at any scale. It is fully managed and supports both document and key-value data models. This flexibility makes it suitable for various applications, including mobile, web, gaming, advertising technology, and Internet of Things (IoT).

In this, we will:
1. Create a DynamoDB table.
2. Enter data into the table.
3. Query the table.
4. Delete the table.

## Objectives
By completing this, we will learn how to:
- Create a DynamoDB table.
- Enter data into a DynamoDB table.
- Query a DynamoDB table.
- Delete a DynamoDB table.

## Task 1: Creating a New Table

In this task, we create a new table in DynamoDB named Music. Each table requires a primary key that is used to partition data across DynamoDB servers. A table can also have a sort key. The combination of a primary key and a sort key uniquely identifies each item in a DynamoDB table.

### Steps:
1. **Access AWS Management Console:**
   - Choose **Services** and then **DynamoDB**.

2. **Create a Table:**
   - Choose **Create table**.
   - For **Table name**, enter `Music`.
   - For **Partition key**, enter `Artist` and leave **String** selected.
   - For **Sort key - optional**, enter `Song` and leave **String** selected.

3. **Configure Settings:**

   Read capacity Provisioned capacity units: 10 Write capacity Provisioned capacity units: 2 Amazon DynamoDB has two read/write capacity modes for processing reads and writes on your tables:
   - Under **Settings**, select **Customize settings** and configure:
     - **Read capacity units:** 10
     - **Write capacity units:** 2

4. **Create Table:**

   On-demand Provisioned (default, free-tier eligible) The read/write capacity mode controls how we are charged for read and write throughput and how we manage capacity. We can set the read/write capacity mode when creating a table or can change it later.

Our table will use default settings for indexes.
   - Choose **Create table**.

The table should be created in less than a minute.

![Creating Table](https://user-images.githubusercontent.com/89054489/232297143-c625b91d-c322-4d5a-83a9-9612d0b61afc.png)
![Configuring Settings](https://user-images.githubusercontent.com/89054489/232297355-19efb2d0-aee6-4311-8084-23f2889b5f17.png)
![Table Created](https://user-images.githubusercontent.com/89054489/232298001-d3585c24-ed57-4541-acfb-318e8408a5d5.png)
![Provisioned](https://user-images.githubusercontent.com/89054489/232298229-a5e7d060-f533-4078-b3e2-c88a483e2a67.png)
![Create Item](https://user-images.githubusercontent.com/89054489/232299231-b02bc1c2-05f8-464f-bcc4-d6f603636d93.png)
![Create item](https://user-images.githubusercontent.com/89054489/232299158-ccdf4f03-a52a-4c34-ae9f-c3027cedfdc9.png)

## Task 2: Adding Data

### Steps:
In this task, we add data to the Music table. A table is a collection of data on a particular topic.

Each table contains multiple items. An item is a group of attributes that is uniquely identifiable among all of the other items. Items in DynamoDB are similar in many ways to rows in other database systems. In DynamoDB, there is no limit to the number of items that we can store in a table.

Each item consists of one or more attributes. An attribute is a fundamental data element, something that does not need to be broken down any further. For example, an item in a Music table contains attributes such as song and artist. Attributes in DynamoDB are similar to columns in other database systems, but each item (row) can have different attributes (columns).

When we write an item to a DynamoDB table, only the primary key and sort key (if used) are required. Other than these fields, the table does not require a schema, which means that we can add attributes to one item that may be different than the attributes on other items.

1. **Explore Items:**
   - Select **Explore items** from the left navigation pane.
   - Select the `Music` table we created.

2. **Create Items:**
   - Click **Create item** and enter the following values:
     - **Artist:** Pink Floyd
     - **Song:** Money
     - Add new attributes:
       - **Album (String):** The Dark Side of the Moon
       - **Year (Number):** 1973
   - Choose **Create item**.

   - Repeat the steps to add more items:
     - **Artist:** John Lennon
       - **Song:** Imagine
       - **Album:** Imagine
       - **Year:** 1971
       - **Genre:** Soft rock
     - **Artist:** Psy
       - **Song:** Gangnam Style
       - **Album:** Psy 6 (Six Rules), Part 1
       - **Year:** 2011
       - **LengthSeconds:** 219

**There are also faster ways to load data into DynamoDB, such as using AWS Data Pipeline, programmatically loading data, or using one of the free tools available on the internet.**

![Adding Data](https://user-images.githubusercontent.com/89054489/232299834-30ce7282-2aec-4857-8a0b-cabb5a063d98.png)
![Data Added](https://user-images.githubusercontent.com/89054489/232300185-cac49f8f-dea0-4455-8bdd-caa96d7d4a45.png)
![Data Added](https://user-images.githubusercontent.com/89054489/232300236-1264d89d-0cc0-40ad-b730-41fc948a4da4.png)

## Task 3: Modifying an Existing Item


Now notice that there is an error in the data. In this task, we modify an existing item.

### Steps:
1. **Edit Item:**
   - From the list of items, select the row where **Artist** is `Psy`.
   - Choose the **Actions** menu, and select **Edit item**.
   - Change the **Year** from `2011` to `2012`.
   - Choose **Save changes**.

The item is now updated.

![Modifying Item](https://user-images.githubusercontent.com/89054489/232300297-5e9d8f2b-c309-4103-9877-b471cf7b91ce.png)
![Item Modified](https://user-images.githubusercontent.com/89054489/232300316-99c90f8c-bf56-4c97-8e7e-859a19fe36f8.png)

## Task 4: Querying the Table

There are two ways to query a DynamoDB table: query and scan.

#### A query operation finds items based on the Primary Key and optionally based on the Sort Key. It is fully indexed, so it runs very fast.

### Steps:
1. **Query Operation:**
   - Choose **Explore items** in the left navigation pane.
   - Select the `Music` table.
   - If Scan/Query items is not already expanded, choose the arrow to expose the Scan and Query options.
   - Choose **Query**.
   - Fields for the Artist (which is the same as partition key) and Song (which is the same as sort key) are now displayed.
   - Enter the following details:
     - **Artist (Partition key):** Psy
     - **Song (Sort key):** Equal to Gangnam Style
   - Choose **Run**.

The song quickly appears in the list. A query is the most efficient way to retrieve data from a DynamoDB table.

#### Alternatively, we can scan for an item. This option involves looking through every item in a table, so this option is less efficient and can take significant time for larger tables.

2. **Scan Operation:**
   - Choose the **Scan** option.
   - Expand **Filters**.
   - Enter values for the scan filter:
     - **Enter attribute name:** Year
     - Change **String** to **Number**.
     - **Condition:** Select **Equal to**
     - **Enter value:** 1971
   - Choose **Run**.

![Querying Table](https://user-images.githubusercontent.com/89054489/232300832-8a1f024a-6a97-4476-b232-5032c36865c1.png)
![Query Result](https://user-images.githubusercontent.com/89054489/232300928-e848e7c9-7d87-4216-b3ef-14e7316672f5.png)
![Scanning Table](https://user-images.githubusercontent.com/89054489/232301243-3629cb7b-1f12-4bb2-bd50-a70680a99c32.png)
![Scan Result](https://user-images.githubusercontent.com/89054489/232301510-4578cfc7-4b14-48f2-9c33-1de55bf21119.png)

## Task 5: Deleting an Item

### In this task, we will delete an item within the table.

### Steps:
1. **Delete Item:**
   - Choose **Reset** then click **Run** to load the full `Music` table.
   - Select the check box for the item where **Artist** is `Psy`.
   - Choose the **Actions** dropdown list, and select **Delete items**.
   - On the **Delete item(s)** screen, choose **Delete**.

![Deleting Item](https://user-images.githubusercontent.com/89054489/232301680-f1e8dfe7-3e55-412f-9119-a2a03f02317c.png)
![Item Deleted](https://user-images.githubusercontent.com/89054489/232301759-42ae0efe-5ec5-4022-9a40-d6456cee23f3.png)
![Item Deleted](https://user-images.githubusercontent.com/89054489/232301992-71a484c3-2209-4237-9f47-eadaf4c3cbc1.png)
![Item Deleted](https://user-images.githubusercontent.com/89054489/232302066-194e5352-636f-4eef-a00c-cbe347c79028.png)
![Item Deleted](https://user-images.githubusercontent.com/89054489/232302242-dd35a5d7-0fc5-4d4c-a061-e36a9489ad00.png)

## Tasks Complete

We have successfully completed the tasks, learning how to create, add data to, modify, query, and delete items in a DynamoDB table.