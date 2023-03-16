module "s3_bucket" {
  source = "terraform-aws-modules/vpc/aws"

}

module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "5.13.0"
}