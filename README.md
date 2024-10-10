# OPA Tutorial

![](https://i.imgur.com/waxVImv.png)
### [View all Roadmaps](https://github.com/nholuongut/all-roadmaps) &nbsp;&middot;&nbsp; [Best Practices](https://github.com/nholuongut/all-roadmaps/blob/main/public/best-practices/) &nbsp;&middot;&nbsp; [Questions](https://www.linkedin.com/in/nholuong/)
<br/>


An OPA Tutorial to accompany this env0 blog post.

## Prerequisites

To follow along, you will need the following:

* An Azure subscription
* Terraform installed locally
* OPA installed locally
* Azure CLI or other option for authentication

## Setup

We will be using the Azure CLI to authenticate to Azure and plan the deployment. Run the following commands to sign into Azure and select your subscription:

```bash
az login
az account set -s SUBSCRIPTION_NAME
```

You won't actually be deploying anything if you don't want to. The key is to generate a Terraform execution plan that we can use to test our OPA policies.

## Running the Tutorial

The Terraform configuration is stored at the root of the repository and the basic policy that is covered in the blog post is in the `policy` directory. There is also a more advanced version of the policy in the `advanced_policies` directory.

You'll want to fork this repository and clone it down to your local machine. Then you can start by generating an execution plan:

```bash
terraform init
terraform plan -out vnet.tfplan
```

OPA expects the input data to be in JSON format, so we will convert the execution plan from binary to JSON with the following command:

```bash
terraform show -json vnet.tfplan > vnet.json
```

## Testing the Policies

To try check out the basic policy, run the following command to see the resources that will be created:

```bash
opa exec --decision terraform/functions/resources_created --bundle policy/ vnet.json
```

You can also see if the Virtual Network is missing some tags:

```bash
opa exec --decision terraform/functions/deny --bundle policy/ vnet.json
```

The advanced policies break things out into separate files and packages. That makes policies more reuasable and easier to maintain. To test the advanced policies, run the following commands:

```bash
opa exec --decision production/deny --bundle advanced_policies/ vnet.json
```

## Conclusion

This is a solid start to exploring what OPA can do. You can build more policies using the basic packages provided, or create packages of your own.


🚀 # I'm are always open to your feedback.  Please contact as bellow information:
### [Contact ]
* [Name: nho Luong]
* [Skype](luongutnho_skype)
* [Github](https://github.com/nholuongut/)
* [Linkedin](https://www.linkedin.com/in/nholuong/)
* [Email Address](luongutnho@hotmail.com)

![](https://i.imgur.com/waxVImv.png)
![](bitfield.png)
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/nholuong)

# License
* Nho Luong (c). All Rights Reserved.🌟