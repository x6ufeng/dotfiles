{
  config,
  pkgs,
  ...
}: {
  services.plex = {
    enable = true;
  };
}
