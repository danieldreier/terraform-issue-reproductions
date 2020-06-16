output "public_ip" {
  value = "${google_compute_address.get_ip.*.address}"
}

