{
  config,
  pkgs,
  ...
}: {
  # 启用 Tailscale 服务
  services.tailscale = {
    enable = true;
    extraUpFlags = ["--accept-dns=false"]; # 禁用 DNS 接受功能
    useRoutingFeatures = "both";
  };

  # 添加必要的系统包
  environment.systemPackages = with pkgs; [
    tailscale
  ];
}
