{pkgs, ...}: {
  home.packages = with pkgs; [
    # Static Site
    hugo

    # Python
    python3
    python312Packages.pip

    # Desktop Customization
    gnome-tweaks
    gnome-extension-manager

    # Social
    element-desktop
    discord
    slack
    signal-desktop

    # Utility
    nfs-utils
    fastfetch

    # Office
    onlyoffice-desktopeditors

    # Flatpak Related
    flatpak


  ];
}
