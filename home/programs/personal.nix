{pkgs, ...}: {
  home.packages = with pkgs; [
    # Static Site
    hugo

    # Desktop Customization
    gnome-tweaks
    gnome-extension-manager

    # Social
    discord
    slack
    signal-desktop

    # Office
    onlyoffice-desktopeditors

  ];
}
