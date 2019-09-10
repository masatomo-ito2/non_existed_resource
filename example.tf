
data "local_file" "resource_not_exist" {
  filename = "${path.module}/not_exist.txt"

  depends_on = [local_file.resource_not_exist]
}

resource "local_file" "resource_not_exist" {
  content  = "foo! This is a file created."
  filename = "${path.module}/not_exist.txt"
}

output "filename" {
  value = "${local_file.resource_not_exist.filename}"
}

