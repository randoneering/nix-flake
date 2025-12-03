{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/79a5d02f-0071-4d9a-a16d-562896b7fb23";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-38a8795e-d976-4853-96c2-30836c1c1106".device = "/dev/disk/by-uuid/38a8795e-d976-4853-96c2-30836c1c1106";

  swapDevices = [
    {device = "/dev/disk/by-uuid/82b9c7e2-cd2b-43f7-9d55-d42de5afb61a";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
