resource "aws_security_group" "default_rules" {
  name        = "default_rules"
  description = "Security group for EC2 instance"
}

resource "aws_security_group_rule" "default_rules_http" {
  security_group_id = aws_security_group.default_rules.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "default_rules_ssh" {
  security_group_id = aws_security_group.default_rules.id

  type        = "ingress"
  from_port   = 22  # Porta SSH
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = 3
  tags = {
    #Name        = var.name
    Name        = "instancia-${count.index + 1}"
    Environment = var.env
    Provisioner = "Terraform"
    Repo        = var.repo
  }

  vpc_security_group_ids = [aws_security_group.default_rules.id]
}
