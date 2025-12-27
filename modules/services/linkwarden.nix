{
  config,
  pkgs,
  ...
}: {
  sops.secrets.linkwarden_env = {
    owner = config.services.linkwarden.user;
  };

  services.linkwarden = {
    enable = true;

    enableRegistration = true;

    environmentFile = config.sops.secrets.linkwarden_env.path;
  };
}
