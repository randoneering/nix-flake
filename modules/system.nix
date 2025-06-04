{
  pkgs,
  lib,
  username,
  ...
}: {


  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel"];
  };

  home-manager.backupFileExtension = "backup";

  nix.settings.trusted-users = [username];
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Allow electron garbage
  #
  nixpkgs.config.permittedInsecurePackages = ["electron-27.3.11"];


  # Set your time zone.
  time.timeZone = "America/Boise";

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
  # Enable CUPS to print documents.
  services.printing.enable = true;

  fonts = {
    packages = with pkgs; [

      # nerdfonts
      nerd-fonts.symbols-only # symbols icon only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # eventually I will get to this, but happy with default fonts at the moment
    # fontconfig.defaultFonts = {
    #   serif = [];
    #   sansSerif = [];
    #   monospace = [];
    #   emoji = [];
    # };
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no"; # disable root login
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    fastfetch
  ];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


}
