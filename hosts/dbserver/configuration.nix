# Randoneering 2025
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    # ./hardware-configuration.nix
  ];
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.initrd.luks.devices."luks-ef0e7846-eabf-409e-96e3-7fc71a5c8542".device = "/dev/disk/by-uuid/ef0e7846-eabf-409e-96e3-7fc71a5c8542";
  # Setup keyfile
  boot.initrd.secrets = {
    "/boot/crypto_keyfile.bin" = null;
  };


  boot.loader.grub.enableCryptodisk = true;

  boot.initrd.luks.devices."luks-97a1aab4-bb60-4084-9763-4be78b197c12".keyFile = "/boot/crypto_keyfile.bin";
  boot.initrd.luks.devices."luks-ef0e7846-eabf-409e-96e3-7fc71a5c8542".keyFile = "/boot/crypto_keyfile.bin";


  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Boise";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable NFS
  services.rpcbind.enable = true; # needed for NFS
  fileSystems."/mnt/jellyfin" = {
    device = "10.10.1.115:/mnt/randoneering_prod/Jellyfin";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90s"];
  };
  fileSystems."/mnt/nextcloud" = {
    device = "10.10.1.115:/mnt/randoneering_prod/Nextcloud";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90s"];
  };

  users.users.randoneering = {
    isNormalUser = true;
    description = "randoneering";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow electron
  nixpkgs.config.permittedInsecurePackages = ["electron-27.3.11"];

  # Enable Flatpak for one offs

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
        curl
        wget
        atuin
        htop
        fish
        fastfetch
        alejandra
        flatpak
  ];

  config.services.postgresql = {
    enable = true;
    ensureDatabases = [ "pgfirstaid" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser   ADDRESS   auth-method
      local all       all      127.0.0.1/32          scram-sha-256
      host  all       all      10.10.1.0/24          scram-sha-256
    '';
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable ssh-agent
  services.openssh.enable = true;


  environment.sessionVariables = {
      EDITOR = "nano";
      TERMINAL = "kitty";
      };

  system.stateVersion = "24.11";
}
