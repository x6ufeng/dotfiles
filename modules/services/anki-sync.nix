{
  config,
  pkgs,
  ...
}: {
  sops.secrets.anki_password = {
    owner = "kyo";
  };
  services.anki-sync-server = {
    enable = true;
    address = "127.0.0.1";
    port = 27701;
    openFirewall = false; # 因为你用了 Cloudflare Tunnel

    users = [
      {
        username = "kyo";
        passwordFile = config.sops.secrets.anki_password.path;
      }
    ];
  };
}
