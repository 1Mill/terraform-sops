provider "sops" {
	version = "~> 0.5.1"
}

data "sops_file" "default" {
  	source_file = "./test.sops.json"
}

output "json" {
	value = jsondecode(data.sops_file.default.raw)
}
