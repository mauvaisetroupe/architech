---
title: "AWS Solution Architect Associate - SAA-C02 - Cheat Sheet"
date: 2023-02-21
tags: [Architecture, AWS, Certification, SAA-C02]
categories: [English, Cheat Sheet]
---


I've passed my [AWS Solution Architect Associate (SAA-C02) certification](https://www.credly.com/badges/8d5ed9cf-0afe-47a8-946a-00e88e80f859) on July 02, 2021.

Here is my cheat sheet


## **Section 3: Getting started with AWS**
### **AWS Cloud Overview - Regions & AZ**
- Region: cluster of AZ (min=2, max=3)
- Availability Zones (AZ): one or more discrete data centers (DC)	
- Points of Presence (Edge Locations): caching S3 & CloudFront
## **Section 4: IAM & AWS CLI**
### **IAM Security Tools**
- Can attach one or more **policies** to an IAM role or to a IAM user
- Credential Report (account-level)
- Access Advisor (user level) – find not-accessed services
- SDK is equivalent but for coding (Java, .Net, etc.) to CLI (based on python SDK) 
## **Section 5: EC2 Fundamentals**
### **EC2 Instances Purchasing Options**
- On demand (Linux billing per second, other per hour)
- Reserved
  - Reserved Instances (up to 72% discount) reserved for 1 year OR 3 years
  - Convertible (up to 45% discount)
  - Scheduled (1 year)
- Spot (up to 90% discount)
- Dedicated host (Compliance reason, Server bound license) - 3 years
- EC2 Instance Metadata - http://169.254.169.254/latest/meta-data
## **Section 6: EC2 - Solutions Architect Associate Level**
### **Elastic IP (EIP)**
- Keep fix public IP when EC2 stops/starts
- 5 per account 
### **Placement Groups**
- Hardware repartition of EC2 instances (same region)
  - Cluster (same rack)
  - Spread (cross AZ, each EC2 on different hardware): 7 instances par AZ 
  - Partition (each partition on separate rack): up to 7 partitions par AZ, 100s EC2 per partition
### **Elastic Network Interfaces (ENI)**
- Virtual network card
  - Primary private IPv4 (eth0), one or more secondary IPv4
  - Many public IP (1 public IP per private)
  - One EIP
  - One or more Security groups
- Bound to AZ
### **Hibernate**
- Root ESB volume must be encrypted
### **EC2 Nitro**
- Nitro is necessary for 64,000 IOPS – max 32,000 on non-Nitro
### **EC2 – vCPU**
- Each vCPU is a thread of a CPU core
- Possible to limit number of CPU cores and number of thread par care (licences)
## **Section 7: EC2 Instance Storage**
### **EBS (Elastic Block Store) Volume**
- Network drive (like network USB stick) 
- Lock to one AZ (even if multi-attach io1/io2)
- Root ESB deleted by default (can be unchecked), other attached volumes are not deleted

![](/blog/2021/2021-07-02/Aspose.Words.f84f645a-6092-4b88-8d17-039622955d5c.001.png)

![](/blog/2021/2021-07-02/Aspose.Words.f84f645a-6092-4b88-8d17-039622955d5c.002.png)
### **ESB Raid configuration**
- RAID 0 = performance
- RAID 1 = fault tolerance
### **EFS – Elastic File System**
- Managed NFS 4.1, Linux - POSIX
- Multi AZ
- High available, scalable (3 x gp2)
- Performance mode: General purpose / Max IO
- Throughput mode: Bursting  / Provisioned
- Lifecycle management (after N days):  Infrequent access (EFS-IA)
## **Section 8: High Availability and Scalability: ELB & ASG**
### **Elastic Load Balancing (ELB) Overview**
- Cross AZ, but same region
- Health check
- Stickiness cookie when layer 7 (not NLB)
- Cross-Zone Load Balancing: each load balancer distributes across all registered instances in all AZ
  - always true ALB, 
  - free inter AZ for CLB & ALB, 
  - cost option for NLB
- Connection Draining (CLB) or Deregistration Delay (ALB, NLB): time to complete request in progress – default 300 seconds
- Uses Server Name Indication (SNI) for ALB & NLB: multiple SSL certificate into one serve

### **CLB - Classic Load Balancers (v1)**
- TCP (Layer 4), HTTP & HTTPS (Layer 7)
- Fixed hostname XXX.region.elb.amazonaws.com
### **ALB - Application Load Balancer (v2)**
- Layer 7 (HTTP & HTTPS)
- Route in different target groups via path, hostname, query string, header:
  - EC2 instance (can be managed by an Auto Scaling Group)
  - ECS task (dynamic port)
  - Lambda functions – HTTP request is translated into a JSON event
  - IP Addresses – must be private Ips
- Health check at target group level
- Fixed hostname (XXX.region.elb.amazonaws.com)
- Client seen via header: IP (X-Forwarded-For), port (X-Forwarded-Port) and proto (X-Forwarded-Proto)
### **NLB - Network Load Balancer (v2)**
- Layer4 (TCP/UDP)
- Million request/second + low latency (100ms vs. 400 ALB)
### **Auto Scaling Group (ASG)**
- ASG defined with:
  - Lauch configuration (AMI, user data, ESB, security groups, SHH key pair) or Lauch Template (new)
  - Min/Max size
  - Subnet
  - One (optional) Load balancing
- If EC instance unhealthy (by EC2 or LB), terminate and create new EC2 instance
- Scale out = increase – Scale in = decrease
- Scaling policies 
  - Simple / Step with CloudWatch Alarm 
  - Target (CPU maintain at 50%)
  - Scheduled
- ` `Cooldown – 300 seconds (could be 180 second)
- Default termination policy:  number of instances > oldest launch configuration > nearest billing hour
## **Section 9: AWS Fundamentals: RDS + Aurora + ElastiCache**
### **Amazon RDS Overview**
- Automated backup:
  - ` `1 daily + transaction logs (every 5 minutes)
  - Retention 7 days (max 35 days)
- Storage Auto Scaling (with **maximum storage threshold**)
- Read replicas: ASYNC replication - same AZ, cross AZ (free) or cross regions (fees)
- Multi-AZ Disaster Recovery: SYNC replication, based on DNS name (automatic)
- IAM-based authentication for login (MySQL & PostgreSQL)
- Encryption at rest
  - AWS KMS – AES 256, 
  - Transparent Data Encryption (TDE) Oracle and MS-SQL
- In-flight encryption rds.force\_SSL (Postgress & MS-SQL) , grant … REQUIRE SLL (MySQL)
- Access Management 
  - Who can manage DB? IAM policies
  - Who can log in? Tradition user/pwd or IAM authentication with 15 minutes token (**MySQL, Postrgress**)
### **Amazon Aurora**
- Support MySQL & Progress
- 5x performance
- Read replicas up to 15 for Aurora (up to 5 for MySQL)
- Automatic storage (up to 64TB, increments of 10GB)
- Instantaneous failover
- Price +20% (vs. RDS)
- Read-Replica autoscaling 
- Writer endpoint + Reader Endpoint + optional custom Endpoint
- Aurora Serverless, via a proxy fleet (endpoint), manage the number of needed instances, pay per second for unpredictable workload
- Muti-Masters, immediate failover for write, client manage multiple DB connections for failover
- Multi-regions:
  - Aurora cross-regions read replica
  - Aurora Global Database, 1 primary region (R/W), up to 5 secondary regions (R-only), up to 16 replicas per region, promoting another region RTO < 1 minutes, replication lag is less than 1 second

|**Feature**|**Amazon Aurora Replicas**|**MySQL Replicas**|
| :- | :- | :- |
|**Number of Replicas**|Up to 15 |Up to 5|
|**Replication type**|Asynchronous (milliseconds)|Asynchronous (seconds)|
|**Performance impact on primary** |Low|High|
|**Act as failover target**|Yes (no data loss)|Yes (potentially minutes of data loss) |
|**Automated failover**|Yes|No|
|**Support for user-defined replication delay**|No|Yes|
|**Support for different data or schema vs. primary**|No|Yes|

### **ElastiCache**
- ElastiCache = managed Redis or Memcached
- Heavy application code change 
- Redis (replication), Memcached (sharding)
- Redis: Multi-AZ, read-replicas, backup restore 
- Do not support IAM authentication,  Redis AUTH for extra level of security (password/token)(over security groups)
## **Section 10: Route 53**
- Possible records
  - A (hostname to IP4),
  - AAAA (hostname to IP6), 
  - CNAME (sub-domain hostname to hostname), 
  - A + alias or AAAA + alias (hostname to AWS service hostname)
- Alias = A with alias or AAAA with alias
- Route53 can use public names I own (aap.mydomain.org) or private domain name in my VPC (app.company.internal)
- Route53 to ALB, 
  - via CNAME (ALB DNS name) not efficient
  - via A + alias (IPv4) or AAAA + alias (IPv6)
- Need to create separately a health check:
  - based on HTTP/HTTPS/TCP
  - based on CloudWatch metric
- Routing policy:
  - Simple, can return multiple values (all) to client (choose random), no health check
  - Weighted
  - Latency
  - Failover: one primary (health check mandatory) and one secondary
  - Geo Location (based on user location)
  - Geoproximity 
  - Multivalues
## **Section 11: Classic Solutions Architecture Discussions**
### **Beanstalk**
- Only code is the responsibility of developer 
- 3 architecture models: Single instance (DEV), LB + ASG (PROD, webapp), ASG (PROD, non-webapp)
- Beanstalk has 3 components: application, application version, environment name
- Go, Java, Tomcat, .Net, nodejs, php, python, ruby, docker
## **Section 12: Amazon S3 Introduction**
### **Overview**
- Bucket (directory), must have global unique name, at region level
- Object (file) have a key: s3://my-bucket/my\_folder1/another\_folder/my\_file.txt (key=prefix+object name)
- No concept of subdirectory (only keys with name including “/”)
- Max object size = 5TB
- Multipart-upload if upload > 5GB
- Versioning at bucket-level
- Strong consistency, after successful write, every subsequent read receives latest version
### **Encryption**
- SSE-S3 – key create and manage by S3 - must set header: “x-amz-server-side-encryption": "AES256"
- SSE-KMS – key create and manage by KMS - must set header: “x-amz-server-side-encryption": ”aws:kms"
  - AWS manage key (aws/s3) 
  - User-created keys
  - Other account user-crated key
- SSE-C - encryption key must be provided in HTTP headers,
- Client-side – client can use S3 encryption SDK
### **S3 Security**
- User based: IAM policy
- Resource based:  bucket policy or object ACL (finer grain)
- IAM principal can access S3 object:
  - if ((use-based OR resource-based allow) AND no explicit deny)
  - if (use-based AND resource-based allow) when not in same account
- By default, S3 blocks public access (prevent company data leaks)
- S3 website, make sur bucket policy allows public reads
- CORS, web-browser mechanism, could be allow in S3 permission via json CORS configuration
### **S3 advanced**
- MFA delete (only enable by CLI with root account and versioning), when enabled:
  - Permanent delete an object version
  - Suspend versioning
- S3 access log: configure another bucket, any access request logged into another bucket
- S3 replication, can add rule to duplicate objects (not retroactive) 
  - to another region (CRR) or same region (SRR) even in a different account
  - must enable versioning 
  - no chaining (bucket 1 > bucket 2 > bucket 3)
- 3500 PUT/COPY/POST/DELETE 5500 GET/HEAD requests per second per prefix 
- Copy data from the source bucket to the destination bucket using the aws S3 sync command
- S3 Select & Glacier Select: server-side filtering
### **S3 Events**
- You can create as many “S3 events” as desired (S3:ObjectCreated, S3:ObjectRemoved, S3:ObjectRestore, S3:Replication, etc.), directly form S2 bucket > properties
- But not possible to create 2 events of same type - IF YOU WANT to send event for PUT two 2 SQS, create a SNS and dispatch to 2 SQS
- Publish events to:
  - SQS
  - SNS
  - Lambda

![](/blog/2021/2021-07-02/Aspose.Words.f84f645a-6092-4b88-8d17-039622955d5c.003.png)


### **S3 storage classes**
![](/blog/2021/2021-07-02/Aspose.Words.f84f645a-6092-4b88-8d17-039622955d5c.004.png)
## **Section 15: CloudFront & AWS Global Accelerator**
### **CloudFront**
- Content Delivery Network (CDN)
- Origins
  - S3 bucket, enhanced security with Origin Acces Identity (OAI)
  - Custom HTTP Origin
- Geo-restriction to whitelist/blacklist countries
- Signed-URL and signed-cookies
- Multi origin:
  - Multi-origin based on path patterns (/API/\*)
  - Origin Groups for failover (one primary, one secondary)
### **Global accelerator**
- Anycast IP: all servers hold the same IP address and the client is routed to the nearest one
- Send via closest Edge Location instead of Internet (latency) via 2 anycast IP
- Works with Elastic IP, EC2 instances, ALB, NLB, public or private
## **Section 16 – AWS Storage Extra**
### **AWS Snow Family Overview**
- Snowball Edge 80TB of HDD (Storage Optimized) or 42TB (Compute Optimized)
- Snowmobile > 10PB
- Need CLI or AWS OpsHub
- Cannot import directly in Glacier

![](/blog/2021/2021-07-02/Aspose.Words.f84f645a-6092-4b88-8d17-039622955d5c.005.png)
### **Storage Gateway Overview**
- For hybrid cloud (see locally an AWS file)
- Only for S3
- 3 types of Storage Gateway: 
  - File Gateway: integrated with Active Directory, NFS or SMB
  - Volume Gateway: iSCSI protocol, cache volume or stored volume 
  - Tape Gateway

|**<br>|**DataSync**|**Storage Gateway**||
| :- | :- | :- | :- |
|**Description**|AWS DataSync is an online data transfer service that simplifies, automates, and accelerates the process of copying large amounts of data to and from AWS storage services over the Internet or over AWS Direct Connect.|AWS Storage Gateway is a hybrid cloud storage service that gives you on-premises access to virtually unlimited cloud storage by linking it to S3. Storage Gateway provides 3 types of storage interfaces for your on-premises applications: file, volume, and tape.||
|**How it Work**|Uses an **agent** which is a virtual machine (VM) that is owned by the user and is used to read or write data from your storage systems. You can activate the agent from the Management Console. The agent will then read from a source location, and sync your data to Amazon S3, Amazon EFS, or Amazon Fsx for Windows File Server.|<p>Uses a **Storage Gateway Appliance** – a VM from Amazon – which is installed and hosted on your data center. After the setup, you can use the AWS console to provision your storage options: File Gateway, Cached Volumes, or Stored Volumes, in which data will be saved to Amazon S3.</p><p>You can also purchase the hardware appliance to facilitate the transfer instead of installing the VM</p>||
|**Protocols**|DataSync connects to existing storage systems and data sources with standard storage protocols (NFS, SMB), or using the Amazon S3 API.|Storage Gateway provides a standard set of storage protocols such as iSCSI, SMB, and NFS.||
|**Storage**|AWS DataSync can copy data between Network File Systems (NFS), SMB file servers or self-managed object storages. It can also move data between your on-premises storage and AWS Snowcone, Amazon S3, Amazon EFS, or Amazon FSx,|<p>File Gateway enables you to store and retrieve objects in Amazon S3 using file protocols such as NFS and SMB.</p><p>Volume Getaway stores your data locally in the gateway and syncs them to Amazon S3. It also allows you to take point-in-time copies of your volumes with EBS snapshots which you can restore and mount to your appliance as iSCSI device. </p><p>Tape Getaway data is immediately stored in Amazon S3 and can be archived to Amazon S3 Glacier or Amazon S3 Glacier Deep Archive.</p>||
|**Pricing**|You are charged standard request, storage, and data transfer rates to read from and write to AWS services, such as Amazon S3, Amazon EFS, AmazonFSx for Windows File Server, and AWS KMS.|You are charged based on the type and amount of storage you use, the requests you make, and the amount of data transferred out of AWS.||
|**Combination**|You can use a combination of DataSync and File Gateway to minimize your on-premises’ operational costs while seamlessly connecting on-premises applications to your cloud storage. AWS DataSync enables you to automate and accelerate online data transfers to AWS storage services. File Getaway then provides your on-premises applications with low latency access to the migrated data.|||
## **Section 17: Decoupling applications: SQS, SNS, Kinesis, Active MQ**
### **Amazon SQS – Standard Queue**
- Default retention of messages: 4 days, maximum of 14 days
### **Kinesis Data Streams**
- Retention between 1 day (default) to 365 days
- Ability to reprocess (replay) data, can’t be deleted (immutability)
## **Section 18: Containers on AWS: ECS, Fargate, ECR & EKS**
Three choices:

- ECS -EC2 Launch Type: Amazon’s own container platform
- ECS – Fargate Launch type: Amazon’s own Serverless container platform
- EKS: Amazon’s managed Kubernetes (open source)
## **Section 22: AWS Monitoring & Audit: CloudWatch, CloudTrail & Config**
### **AWS CloudWatch metrics**
- CloudWatch provides metrics for every service in AWS
- Every 5 minutes, every 1 minutes for detailed monitoring (cost)
- Possibility to define and send your own **custom metrics** to CloudWatch (API putMetricData), standard 60 second, high resolution 1 second
- CloudWatch Unified Agent for EC2: 
  - CPU, Disk metrics, Netsat (out-of-the-box, but low detailed)
  - RAM, process, swap space
### **AWS CloudWatch Dashboard**
- Dashboards can display graphs from different regions
### **AWS CloudWatch Logs**
- Applications can send logs to CloudWatch using the SDK
- From 
  - Beanstalk, ECS, Lambda, Flow logs, API Gateway, CloudTrail, Route 53, 
  - Log Agent: collect logs from to send to CloudWatch Logs
- CloudWatch logs can go to 
  - Batch exporter to S3
  - Stream to ElasticSearch
- CloudWatch Logs insight
### **CloudWatch Events**
- Trigger notifications for any metrics
  - Auto-scaling
  - EC2 Actions (start, terminate, reboot)
  - Lambdas
  - SQS / SNS / Kinesis Messages
### **AWS CloudTrail**
- Get an history of events / API calls made within your AWS Account (console, CLI, SDK, AWS services) to CloudTrail console (90 days)
- Can export CloudTrail console to: 
  - CloudWatch logs
  - S3 (long term retention)
- CloudTrail events:
  - Management events, enabled by default: operations done on AWS resources (configurations changed)
  - Data events, disabled by default: S3 object-level activities, Lambda activities 
  - Insights events
### **AWS Config**
- Record configuration changes
- Evaluate resources against compliance rules (unrestricted SSH access to my security groups)
## **Section 23: Identity and Access Management (IAM) – Advanced**
### **AWS STS – Security Token Service**
- Allows to grant limited and temporary access to AWS resources.
- Token is valid for up to one hour (must be refreshed)
- 3 assume Role Options:
  - AssumeRole
  - <a name="_hlk75984423"></a>AssumeRoleWithSAML
  - AssumeRoleWithWebIdentity
- STS Get Tokens:
  - GetFederationToken
  - GetSessionToken
### **Identity Federation in AWS**
- SAML 2.0 Federation 
  - Use STS with AssumeRoleWithSAML
  - Amazon Single Sign On (SSO) Federation is the new managed and simpler way
- Custom Identity Broker Application
  - When non SAML2 compatible
  - Uses the STS API: AssumeRole or GetFederationToken
- Web Identity Federation
  - Use STS AssumeRoleWithWebIdentity
  - Not recommended by AWS – use Cognito instead 
- AWS Cognito
  - Provide direct access to AWS Resources from the Client Side (mobile, web app)
  - OpenID : Facebook, Google, Cognito User Pools (CUP)
- AWS Single Sign-On (SSO)
  - Integrated with AWS Organisation
  - Support SAML2 
### **Microsoft Active Directory (AD)**
- AWS Managed Microsoft AD (on-premise + AWS)
- AD Connector (on-premise side)
- Simple AD (AWS-side)
## **Section 24: AWS Security & Encryption: KMS, SSM Parameter Store, CloudHSM, Shield, WAF**

|**Type of CMK**|**Can view**|**Can manage**|**Used only for my AWS account**|
| :-: | :-: | :-: | :-: |
|AWS owned CMK|No|No|No|
|AWS managed CMK|Yes|No|Yes|
|Customer managed CMK|Yes|Yes|Yes|

