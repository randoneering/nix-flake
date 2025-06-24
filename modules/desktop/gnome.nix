{pkgs, username, ...}: {
  services.displayManager = {
    sddm.enableHidpi = true;
  };

  gtk = {
    enable = true;

    theme = {
      name = "dracula-theme";
      package = pkgs.dracula-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  home.sessionVariables.GTK_THEME = "dracula";

  # ...

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.user-themes.extensionUuid
          pkgs.gnomeExtensions.utcclock.extensionUuid
          pkgs.gnomeExtensions.tiling-shell.extensionUuid
          pkgs.gnomeExtensions.date-menu-formatter.extensionUuid
        ];
        "org/gnome/desktop/background" = {
          picture-uri = "file:///home/${username}/Documents/nix-flake/modules/desktop/wallpaper.jpg";
        };
        "org/gnome/shell/extensions/user-theme" = {
          name = "dracula";
        };
    }
  }

    };
  };

  services.xserver = {
    enable = true;

    desktopManager = {
      gnome.enable = true;
    };

    displayManager = {
      gdm.enable = true;
    };

    # Configure keymap in X11
    xkb.layout = "us";
    xkb.variant = "";
  };

  # disable gnome packages
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



}
