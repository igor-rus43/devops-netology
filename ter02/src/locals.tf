locals {
  web = "${var.vm_name}-${var.vm_env[0]}"
  db  = "${var.vm_name}-${var.vm_env[1]}"
}