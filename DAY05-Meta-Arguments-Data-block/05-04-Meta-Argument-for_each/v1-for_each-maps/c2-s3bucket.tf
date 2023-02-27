

resource "aws_s3_bucket" "mys3bucket" {

  # for_each Meta-Argument
  for_each = {
    dev  = "my-dapp-bucket-157673692367"
    qa   = "my-qapp-bucket-157673692367"
    stag = "my-sapp-bucket-157673692367"
    prod = "my-papp-bucket-157673692367"
  }

  bucket = "${each.key}-${each.value}"

  tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}

