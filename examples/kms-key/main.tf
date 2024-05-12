module "kms" {
  source = "../../modules/key"
  name   = "test-key"
  aliases = [
    "alias/eks"
  ]
  policy = jsonencode(
    {
      "Statement" : [
        {
          "Sid" : "KeyUsage",
          "Effect" : "Allow",
          "Actions" : [
            "kms:Encrypt",
            "kms:Decrypt",
            "kms:ReEncrypt*",
            "kms:GenerateDataKey*",
            "kms:DescribeKey",
          ],
          "Resource" : "*",
          "Principals" : {
            "type" : "AWS",
            "identifiers" : "test1"
          }
        }
      ]
    }
  )
}
