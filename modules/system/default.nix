{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./networking.nix
    ./docker.nix
  ];
}
