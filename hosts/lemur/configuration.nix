# Randoneering 2025
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Enable Cosmic DE
  hardware.system76.enableAll = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # Enable the GNOME Desktop Environment.
  services.displayManager.sddm.enableHidpi = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs.gnome; [
    pkgs.atomix # puzzle game
    pkgs.cheese # webcam tool
    pkgs.epiphany # web browser
    pkgs.evince # document viewer
    pkgs.geary # email reader
    pkgs.gedit # text editor
    pkgs.hitori # sudoku game
    pkgs.iagno # go game
    pkgs.tali # poker game
    pkgs.totem # video player
  ];
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable NFS
  boot.supportedFilesystems = [ "nfs" ];
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
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
    wget
    ansible
    ansible-lint
    git
    element-desktop
    bitwarden
    firefox
    gnome-extension-manager
    discord
    remmina
    fastfetch
    signal-desktop
    bash
    dig
    python3
    python312Packages.pip
    fish
    hugo
    onlyoffice-desktopeditors
    starship
    btop
    flameshot
    nfs-utils
    kitty
    atuin
    gnome-tweaks
    joplin-desktop
    zed-editor
    alejandra
    ripgrep
    flatpak
    slack
    super-productivity
    syft
    grype
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable ssh-agent
  services.openssh.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;


  environment.sessionVariables = {
  EDITOR = "nano";
  TERMINAL = "kitty";
  };

  system.stateVersion = "25.05";
}
