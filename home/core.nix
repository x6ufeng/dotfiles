{pkgs, ...}: {
  home.packages = with pkgs; [
    zip
    xz
    unzip
    p7zip
    fzf # A command-line fuzzy finder
  ];

  programs = {
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}
