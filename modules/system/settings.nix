# modules/system/base/settings.nix
{
  config,
  pkgs,
  ...
}: {
  # 系统基础配置
  system.stateVersion = "24.11";
  time.timeZone = "Asia/Tokyo";
  programs.zsh.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  services.fstrim.enable = true;
  services.thermald.enable = true;
  powerManagement.cpuFreqGovernor = "powersave";
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # 现代 NUC 使用的驱动
    ];
  };

  nix = {
    settings = {
      max-jobs = "auto";
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
