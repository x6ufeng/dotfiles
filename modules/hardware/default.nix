{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./detection.nix
    ./boot.nix
  ];
}
