environment          = "ops"
gcp_project          = "dyl2-ops"
gcp_region           = "us-central1"
gcp_zone             = "us-central1-a"
dns_zone             = "ops.dylvoip.com"
service_account_id   = "dyl2-ops"
config = {
    sbc = {
        mysql_binlog_disable = true
        kamailio_dyl_host   = "my.dyl.com"
        kamailio_tls_key    = "/etc/ssl/sip.dylphone.com.key"
        kamailio_tls_cert   = "/etc/ssl/sip.dylphone.com.crt"
        kamailio_tls_domain = "sips.ops.dylvoip.com"
    }
}

hosts = [{
  hostname = "sbc3.ops.dylvoip.com"
  name     = "sbc3-ops"
  groups   = "registrar_hosts"
  size     = 10
}
#,{
#  hostname = "sbc4.ops.dylvoip.com"
#  name     = "sbc4-ops"
#  groups   = "registrar_hosts"
#  size     = 10
#}
]
