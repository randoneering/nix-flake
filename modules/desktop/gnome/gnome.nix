{
  pkgs,
  username,
  config,
  ...
}: {
  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUSePortal = true;
  #   extraPortals = with pkgs; [xdg-desktop-portal-gnome];
  # };

  # gtk = {
  #   enable = true;

  #   theme = {
  #     name = "dracula-theme";
  #     package = pkgs.dracula-theme;
  #   };

  #   gtk3.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };

  #   gtk4.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  # };
  #home.sessionVariables.GTK_THEME = "dracula";

  # dconf.enable = true;
  #   dconf.settings = {
  #     "org/gnome/shell" = {
  #       disable-user-extensions = false;
  #       enabled-extensions = [
  #         pkgs.gnomeExtensions.user-themes.extensionUuid
  #         pkgs.gnomeExtensions.utcclock.extensionUuid
  #         pkgs.gnomeExtensions.tiling-shell.extensionUuid
  #         pkgs.gnomeExtensions.date-menu-formatter.extensionUuid
  #       ];
  #       "org/gnome/desktop/background" = {
  #         picture-uri = "file:///home/${username}/Documents/nix-flake/modules/desktop/gnome/wallpaper.jpg";
  #       };
  #       "org/gnome/shell/extensions/user-theme" = {
  #         name = "dracula";
  #       };
  #   };

  services.desktopManager = {
    gnome.enable = true;
  };

  services.displayManager = {
    gdm.enable = true;
    sddm.enableHidpi = true;
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
