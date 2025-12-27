{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  imports = [
    ./shell.nix
    ./core.nix
  ];

  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";

  # Enable home-manager
  programs.home-manager.enable = true;

  # State version
  home.stateVersion = "24.11";

  home.enableNixpkgsReleaseCheck = false;
}
