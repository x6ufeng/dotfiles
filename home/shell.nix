{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "af-magic";
    syntaxHighlighting.enable = true;
  };

  programs.git = {
  enable = true;
  userName  = "x6ufeng";
  userEmail = "freddie.hsu@outlook.com";
};
}
