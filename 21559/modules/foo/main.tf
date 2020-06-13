data "local_file" "foo" {
    filename = "${path.module}/foo.bar"
}

output "foo_content" {
  value = chomp(data.local_file.foo.content)
}
