resource "aws_iam_role" "bastion-role" {
  name        = "${var.classroom_namespace}-bastion-ssm-role"
  path        = "/"
  description = "AWS IAM Role required for SSM managed bastions"
  tags = merge(module.common_tags.required_tags, {
    "Name" = "${var.classroom_namespace}-bastion-role"
  })
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "attach-ssmManagedInstanceCore" {
  role       = aws_iam_role.bastion-role.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

resource "aws_iam_instance_profile" "bastion-iam-profile" {
  name = "${var.classroom_namespace}-bastion-instance-profile"
  role = aws_iam_role.bastion-role.name
}

data "aws_partition" "current" {}
data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
