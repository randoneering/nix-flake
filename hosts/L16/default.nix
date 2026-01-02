{
  config,
  pkgs,
  lib,
  username,
  nix-opcode,
  ...
}: {
  imports = [
    ../../modules/system.nix
    ../../modules/desktop/gnome/gnome.nix
    ../../modules/networking
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-6c7efb18-8b6a-4e45-ae5f-f5f35162f86b".device = "/dev/disk/by-uuid/6c7efb18-8b6a-4e45-ae5f-f5f35162f86b";
  networking.hostName = "nix-l16";
  networking.networkmanager.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  # Enable 32bit
  hardware.graphics.enable32Bit = true;
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
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.systemPackages = [
    nix-opcode.packages.x86_64-linux.default  # Installs opcode binary
  ];
  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  system.stateVersion = "25.05"; # Did you read the comment?
}
