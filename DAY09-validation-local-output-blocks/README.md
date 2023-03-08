# Terraform Input Variables

## Step-01: Implement Custom Validation Rules in Variables
- **Reference Sub folder:** 02-Input-Variables-Validation-Rules
- Understand and implement custom validation rules in variables
- [Terraform Console](https://www.terraform.io/docs/cli/commands/console.html)
- The `terraform console` command provides an interactive console for evaluating expressions.
### Step-02: Learn Terraform Length Function
- [Terraform Length Function](https://www.terraform.io/docs/language/functions/length.html)
```t
# Go to Terraform Console
terraform console

# Test length function
Template: length()
length("hi")
length("hello")
length(["a", "b", "c"]) # List
length({"key" = "value"}) # Map
length({"key1" = "value1", "key2" = "value2" }) #Map
```

### Step-03: Learn Terraform SubString Function
- [Terraform Sub String Function](https://www.terraform.io/docs/language/functions/substr.html)
```t
# Go to Terraform Console
terraform console

# Test substr function
Template: substr(string, offset, length)
substr("terraform course", 1, 4)
substr("terraform course", 0, 6)
substr("terraform course", 0, 1)
substr("terraform course", 0, 0)
substr("terraform course", 0, 10)
```

### Step-04: Implement Validation Rule for ec2_ami_id variable
```
variable "ec2_ami_id" {
  description = "AMI ID"
  type = string  
  default = "ami-0be2609ba883822ec"
  validation {
    condition = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id, 0, 4) == "ami-"
    error_message = "The ec2_ami_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
```
- **Run Terraform commands**
```
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan
```

## Step-5: Protect Sensitive Input Variables
- **Reference Sub folder:** v10-Sensitive-Input-Variables
- [AWS RDS DB Instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance)
- When using environment variables to set sensitive values, keep in mind that those values will be in your environment and command-line history
`Example: export TF_VAR_db_username=admin TF_VAR_db_password=adifferentpassword`
- When you use sensitive variables in your Terraform configuration, you can use them as you would any other variable. 
- Terraform will `redact` these values in command output and log files, and raise an error when it detects that they will be exposed in other ways.
- **Important Note-1:** Never check-in `secrets.tfvars` to git repositories
- **Important Note-2:** Terraform state file contains values for these sensitive variables `terraform.tfstate`. You must keep your state file secure to avoid exposing this data.
```
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan -var-file="secrets.tfvars"

# Create Resources
terraform apply -var-file="secrets.tfvars"

# Verify Terraform State files
grep password terraform.tfstate
grep username terraform.tfstate 

# Destroy Resources
terraform destroy var-file="secrets.tfvars"

# Clean-Up
rm -rf .terraform*
rm -rf terraform.tfstate*
```

### Variable Definition Precedence
- [Terraform Variable Definition Precedence](https://www.terraform.io/docs/language/values/variables.html#variable-definition-precedence)


## Step-6: Understand about `File` function
- **Reference Sub folder:** v11-File-Function
- Understand about [Terraform File Function](https://www.terraform.io/docs/language/functions/file.html)

```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan 

# Create Resources
terraform apply 

# Access Application
http://<Public-IP>

# Destroy Resources
terraform destroy -auto-approve
```


## References
- [Terraform Input Variables](https://www.terraform.io/docs/language/values/variables.html)
- [Resource: AWS EC2 Instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [Resource: AWS Security Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [Sensitive Variables - Additional Reference](https://learn.hashicorp.com/tutorials/terraform/sensitive-variables)



