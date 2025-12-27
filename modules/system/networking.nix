{
  config,
  pkgs,
  ...
}: {
  # 网络基础配置
  networking = {
    hostName = "nixos";
    firewall = {
      enable = true;
      allowedUDPPorts = [443];
      checkReversePath = "loose";
    };
  };

  # 安全服务配置
  services.openssh = {
    enable = true;
  };
}
