# Randoneering 2025
{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  imports = [
    ../../modules/system.nix
    ../../modules/desktop/gnome/gnome.nix
    ../../modules/networking
    ./hardware-configuration.nix
  ];

  boot.initrd.luks.devices."luks-1f6de9c7-37ee-491d-8639-33efc75ee9d0".device = "/dev/disk/by-uuid/1f6de9c7-37ee-491d-8639-33efc75ee9d0";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Flox Settings
  nix.settings.trusted-substituters = ["https://cache.flox.dev"];
  nix.settings.trusted-public-keys = ["flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="];

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nix-lemur";

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
