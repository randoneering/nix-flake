{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/atuin-desktop.nix
      ../../modules/desktop/gnome/gnome.nix
      ../../modules/networking
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Flox Settings
  nix.settings.trusted-substituters = [ "https://cache.flox.dev" ];
  nix.settings.trusted-public-keys = [ "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs=" ];

  boot.initrd.luks.devices."luks-6c7efb18-8b6a-4e45-ae5f-f5f35162f86b".device = "/dev/disk/by-uuid/6c7efb18-8b6a-4e45-ae5f-f5f35162f86b";
  networking.hostName = "nix-l16";
  networking.networkmanager.enable = true;

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
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  system.stateVersion = "25.05"; # Did you read the comment?

}
