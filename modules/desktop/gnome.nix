{pkgs, ...}: {

  services.displayManager = {
    sddm.enableHidpi = true;
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
