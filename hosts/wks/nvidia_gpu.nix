{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia-container-toolkit = {
    enable = true;
  };
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    modesetting.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
