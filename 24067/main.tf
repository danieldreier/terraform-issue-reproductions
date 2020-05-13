module "test" {
  source = "./module/test"
  components = {
    kv = {}
    pki = {
      domains = ["fakeapp.domain.com"]
    }
  }
}

output "policies" {
  value = module.test
}
