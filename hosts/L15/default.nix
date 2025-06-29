# Randoneering 2025
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/system.nix
    ../../modules/desktop/gnome.nix
    ../../modules/networking
    ./hardware-configuration.nix
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Flatpak just in case
  services.flatpak.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # environment.sessionVariables = {
  #   EDITOR = "nano";
  #   TERMINAL = "kitty";
  # };

  system.stateVersion = "25.05";
}
