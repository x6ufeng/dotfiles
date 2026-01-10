{
  config,
  pkgs,
  ...
}: {
  virtualisation.docker.enable = true;

  # 新增：启用 Docker IPv6 支持
  virtualisation.docker.daemon.settings = {
    ipv6 = true;
    fixed-cidr-v6 = "fd00:ffff::/80"; # 分配一个私有 IPv6 地址段
    ip6tables = true; # 建议开启，让 Docker 自动处理 IPv6 防火墙规则
  };

  users.users.kyo.extraGroups = ["docker"];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
