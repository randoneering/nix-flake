{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/desktop/gnome/gnome.nix
      ../../modules/networking
      ../../modules/llm
      ./nvidia_gpu.nix
      ./hardware-configuration.nix
    ];

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;
  boot.initrd.luks.devices."luks-25ac66f8-28c2-4b24-9f65-2aa0a8f0ad2c".device = "/dev/disk/by-uuid/25ac66f8-28c2-4b24-9f65-2aa0a8f0ad2c";

  # Setup keyfile
  boot.initrd.secrets = {
    "/boot/crypto_keyfile.bin" = null;
  };
  boot.initrd.luks.devices."luks-38a8795e-d976-4853-96c2-30836c1c1106".keyFile = "/boot/crypto_keyfile.bin";
  boot.initrd.luks.devices."luks-25ac66f8-28c2-4b24-9f65-2aa0a8f0ad2c".keyFile = "/boot/crypto_keyfile.bin";

  # Flox Settings
  nix.settings.trusted-substituters = [ "https://cache.flox.dev" ];
  nix.settings.trusted-public-keys = [ "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs=" ];

  # Steam
  programs.steam.enable = true;

  # Networking
  networking.hostName = "nix-wks";
  networking.networkmanager.enable = true;
  # Enable 32bit
  hardware.opengl.driSupport32Bit = true;
  # Enable NFS
  boot.supportedFilesystems = ["nfs"];
  services.rpcbind.enable = true; # needed for NFS
  fileSystems."/mnt/jellyfin" = {
    device = "nas.randoneering.cloud:/mnt/randoneering_prod/Jellyfin";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=5s"];
  };
  fileSystems."/mnt/nextcloud" = {
    device = "nas.randoneering.cloud:/mnt/randoneering_prod/NextCloud";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=5s"];
  };


  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  system.stateVersion = "25.05";

}
