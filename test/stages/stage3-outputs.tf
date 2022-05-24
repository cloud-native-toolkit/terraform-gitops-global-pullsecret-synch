
resource null_resource write_outputs {
  provisioner "local-exec" {
    command = "echo \"$${OUTPUT}\" > gitops-output.json"

    environment = {
      OUTPUT = jsonencode({
        name        = module.global_pull_secret_synch.name
        branch      = module.global_pull_secret_synch.branch
        namespace   = module.global_pull_secret_synch.namespace
        server_name = module.global_pull_secret_synch.server_name
        layer       = module.global_pull_secret_synch.layer
        layer_dir   = module.global_pull_secret_synch.layer == "infrastructure" ? "1-infrastructure" : (module.global_pull_secret_synch.layer == "services" ? "2-services" : "3-applications")
        type        = module.global_pull_secret_synch.type
      })
    }
  }
}
