{
  config,
  pkgs,
  username,
  ...
}: {
  users.users.kyo = {
    isNormalUser = true;
    shell = pkgs.zsh;
    home = "/home/kyo";
    description = "Kyo's Server User";
    extraGroups = ["wheel" "networkmanager"];
    hashedPasswordFile = config.sops.secrets.kyo_password.path;
  };
}
