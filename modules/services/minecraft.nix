{
  pkgs,
  lib,
  ...
}: {
  services.minecraft-server = {
    enable = true;
    package = pkgs.papermcServers.papermc-1_21_5;
    eula = true;
    serverProperties = {
      server-port = 25565;
      gamemode = "survival";
      difficulty = "normal";
      max-players = 20;
      white-list = false;
    };
    jvmOpts = "-Xmx8096M -Xms1024M";
  };
}
