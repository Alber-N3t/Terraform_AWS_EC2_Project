# 🤖 Project Overview
This is my first ever project in my journey of expanding my skills on Cloud & Security Engineering. This Infrastructure as a Code (IaC) project is my first steps on expanding my knowledge on Terraform and all its magnificent features, while also learning about automation in cloud.

In this project, I'll be:
* Setting up the AWS Provider to the London region (**eu-west-2**)
* Deploying an AWS EC2 Instance with a **Windows Server 2025 Base AMI** and a **T2.Micro Instance Type**
* Tagging the EC2 instance with a specific tag ("EC2_Test" in this instance)

# 📝Project Prerequisites
Here are several stuff that will are needed before actualling starting this project:
  * Any IDE - I prefer Visual Studio Code, but you can choose any other IDE that supports Terraform.
  * AWS CLI - In order to not Hard-Code any sort of details such as the AWS Access and Secret Key, we will use the AWS CLI to configure and authenticate the profile instead of hard-coding the keys within the main .tf file.
  * Terraform - How else could I do this Project if I do not have Terraform? 😂

# 🔒Warning - Hard-coding your AWS Keys 
***IT IS VERY IMPORTANT THAT YOU DO NOT HARD-CODE ANY SORT OF CREDENTIALS LIKE THE AWS ACCCESS AND SECRET KEY IN THIS INSTANCE !!!!!!!!***

In order to not post the access/secret keys along with the code, we will need to configure the credentials credentials using the AWS CLI. 
In command prompt, type:
```
aws configure --profile "my-profile-name"
```

After typing this and hitting enter, the CLI will ask you for the following:
 * AWS Access Key
 * AWS Secret Access Key
 * Default Region - eu-west-2 in this instance, but it all depends on which region you want to create the instance. For this project, I've chosen eu-west-2 (London)

By doing this, your credentials are safely stored, and there will be no need to hard-code your Access and Secret Key.


# 🧑‍💻Code Breakdown
In this section, I'll be breaking down the AWS_EC2.tf file and what each part of the code does.
```
 provider "aws" {
  region = "eu-west-2"
}
```
This section of the code tells Terraform to use AWS Provider, while also setting the AWS region to EU (London) — this is where the resources will be created.


```
resource "aws_instance" "FirstEC2" {
    ami = "ami-0ba9276d1fb25ed77" #Windows Sever 2025 Base AMI
    instance_type = "t2.micro"

    tags = {
      Name = "EC2_Test"
    }
```
This section is where we are telling Terraform to create an AWS EC2 Instance. We give it the internal Terraform name FirstEC2.

Further to that, we specify the AMI (Amazon Machine Image) by providing Terraform with the AMI code for Windows Server 2025 Base.

Since we are creating & deploying an EC2, we need to also specify the Instance Type, which is "t2.micro" in this instance.
We also gave this EC2 Instance a tag.

## 👟 Running the code using Powershell
Once the code has been written and save, we will need to access Powershell to make this code do its thing.

First, we type ``` terraform init ``` to get our Terraform project ready to use. This will download all the provider plugins that we need to make the code work, while also preparing Terraform to run other commands like ```terraform plan```, ```terraform apply```, or ```terarform destroy```

Once Terraform has been initiated, we can type ```terraform plan``` so that we can see what Terraform will do before we actually apply it by typing ```terraform apply```

After reviewing the plan, go ahead and type ```terraform apply``` for Terraform to create the EC2 Instance.


After performing the ```terraform apply``` command, you should see the below:
![image](https://github.com/user-attachments/assets/f2a6b2f3-d6c1-44cd-8f75-33158d8a0b64)


Now check AWS if the new EC2 Instance shows under EC2
![image](https://github.com/user-attachments/assets/1eccd3d5-f00e-4481-8225-2de4718c8d42)

Congratulations, the EC2 Instance has been created through Terraform :)

#  🤓 Conclusion
This is first of many projects where I'll be doing where Terraform and some sort of Cloud Platform will be utilised to create amazing stuff. I was incredibly joyful when I was finally able to create my first EC2 instance, and I'm looking forward to doing other Terraform projects :)

