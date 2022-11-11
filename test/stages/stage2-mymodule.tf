module "global_pull_secret_synch" {
  source = "./module"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.dev_tools_namespace.name
  kubeseal_cert = module.gitops.sealed_secrets_cert
}
