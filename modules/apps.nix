{
  pkgs,
  config,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    sops
    docker-compose
    ssh-to-age
    tree
    neovim
    jdk
    git
    btop
    rustc
    cargo
    gcc
    wget
    curl
    compose2nix
    tmux
    btop
    fastfetch
  ];
}
