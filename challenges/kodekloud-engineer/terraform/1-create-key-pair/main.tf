resource "tls_private_key" "datacenter-kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_sensitive_file" "datacenter-kp" {
  filename        = "${path.module}/datacenter-kp.pem"
  content         = tls_private_key.datacenter-kp.private_key_pem
  file_permission = "0600"
}

resource "aws_key_pair" "datacenter-kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter-kp.public_key_openssh
}
