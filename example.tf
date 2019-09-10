
data "local_file" "resource_not_exist" {
  filename = "${path.module}/not_exist.bar"

  depends_on = [local_file.resource_not_exist]
}

resource "local_file" "resource_not_exist" {
  content  = "foo! This is a file created."
  filename = "${path.module}/not_exist.bar"
}

output "filename" {
  value = "${local_file.resource_not_exist.*.filename}"
}

