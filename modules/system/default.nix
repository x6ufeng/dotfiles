{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./networking.nix
  ];
}
