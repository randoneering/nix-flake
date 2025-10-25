{pkgs, ...}: {
  home.packages = with pkgs; [
    # Static Site
    hugo

    # Desktop Customization
    gnome-tweaks
    gnome-extension-manager

    # Gaming
    steam-unwrapped
    # Social
    discord
    slack
    signal-desktop

    # Office
    onlyoffice-desktopeditors

  ];
}
