resource "null_resource" "nginx" {
 provisioner "local-exec" {
  command = "echo kubectl apply -f nginx.yaml"
 }
 provisioner "local-exec" {
  when = destroy
  command = "echo kubectl delete -f nginx.yaml"
 }
}
