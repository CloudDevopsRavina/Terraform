module "dev" {
    # source = "github.com/CloudDevopsRavina/Terraform/Day-10-Module-souce"
    # source = "github.com/CloudDevopsRavina/Terraform//Day-10-Module-souce"
    source = "github.com/CloudDevopsRavina/Terraform/Day-12-hardcoding-s3-resouce-block-ec2"
     ami = "12345"
     instance_type = "t3.small"
     #these value not highlated when typed but it's created by calling from github
   
}
#when ever u chage the source run terraform init
# PS C:\Users\ravin\DevOps\AWS Devops\Terraform\Terraform\Day-12-module-git-source> terraform plan
# ╷
# │ Error: Module source has changed
# │
# │   on main.tf line 4, in module "dev":
# │    4:     source = "github.com/CloudDevopsRavina/Terraform/Day-12-hardcoding-s3-resouce-block-ec2"
# │
# │ The source address was changed since this module was installed. Run "terraform init" to install all modules
# │ required by this configuration.
# ╵