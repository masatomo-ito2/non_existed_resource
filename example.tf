variable "file_count" {
  default = 1
}

data "local_file" "resource_not_exist" {
  count    = "${var.file_count}"
  filename = "${path.module}/not_exist.bar"

  depends_on = [local_file.resource_not_exist]
}

resource "local_file" "resource_not_exist" {
  count    = "${var.file_count}"
  content  = "foo! This is file created: ${count.index}"
  filename = "${path.module}/not_exist.bar"
}

output "filename" {
  value = "${local_file.resource_not_exist.*.filename}"
}

