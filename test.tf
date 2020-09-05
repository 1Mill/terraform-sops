terraform {
	required_providers {
		sops = {
			source  = "registry.terraform.io/carlpett/sops"
		}
	}
}

provider "sops" {
	version = "~> 0.5.2"
}

data "sops_file" "default" {
  	source_file = "./test.sops.json"
}

output "json" {
	value = jsondecode(data.sops_file.default.raw)
}
