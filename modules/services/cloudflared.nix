{
  config,
  pkgs,
  ...
}: {
  sops.secrets.cloudflare_token = {
  };
  environment.systemPackages = [pkgs.cloudflared];
  systemd.services.cloudflared-homelab = {
    description = "Cloudflare Tunnel: homelab";
    after = ["network-online.target"];
    wants = ["network-online.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel run --token-file ${config.sops.secrets.cloudflare_token.path}";
      Restart = "always";
      User = "root";
      RestartSec = "5s";
    };
  };
}
