resource "google_compute_address" "get_ip" {
    name = "${var.hosts[count.index].name}-ip"
    count = length(var.hosts)
}

